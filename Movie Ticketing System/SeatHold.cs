using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Movie_Ticketing_System
{
    // A seat in an unpaid booking is held for HoldMinutes from when it was picked, then goes back on sale.
    // Expired holds are cleared whenever a page that shows seats or the cart loads.
    public static class SeatHold
    {
        public const int HoldMinutes = 5;

        // Takes expired seats out of unpaid carts and makes them bookable again
        public static void ReleaseExpired()
        {
            Run(@"DELETE BookingSeat
                  OUTPUT deleted.SeatId INTO @Released
                  FROM BookingSeat INNER JOIN Booking ON Booking.BookingId = BookingSeat.BookingId
                  WHERE (Booking.PaymentCard IS NULL OR Booking.PaymentCard = '')
                    AND (BookingSeat.HeldAt IS NULL OR BookingSeat.HeldAt < DATEADD(minute, -@Minutes, GETDATE()));",
                "@Minutes", HoldMinutes);
        }

        // Takes one seat out of the cart and makes it bookable again
        public static void Release(string bookingSeatId)
        {
            Run(@"DELETE FROM BookingSeat
                  OUTPUT deleted.SeatId INTO @Released
                  WHERE BookingSeatId = @BookingSeatId;",
                "@BookingSeatId", bookingSeatId);
        }

        // Seconds left before the first seat in this booking goes back on sale, or -1 when it holds no seats
        public static int SecondsLeft(string bookingId)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT DATEDIFF(second, GETDATE(), DATEADD(minute, @Minutes, MIN(HeldAt))) FROM BookingSeat WHERE BookingId = @BookingId", con);
                cmd.Parameters.AddWithValue("@Minutes", HoldMinutes);
                cmd.Parameters.AddWithValue("@BookingId", bookingId);
                object seconds = cmd.ExecuteScalar();
                return seconds == null || seconds == DBNull.Value ? -1 : Math.Max(0, Convert.ToInt32(seconds));
            }
        }

        public static int SeatCount(string bookingId)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM BookingSeat WHERE BookingId = @BookingId", con);
                cmd.Parameters.AddWithValue("@BookingId", bookingId);
                return (int)cmd.ExecuteScalar();
            }
        }

        // Runs a statement that deletes BookingSeat rows into @Released, then frees those seats unless another cart still holds them
        private static void Run(string deleteHolds, string parameterName, object parameterValue)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(
                    @"SET XACT_ABORT ON;
                      BEGIN TRANSACTION;
                      DECLARE @Released TABLE (SeatId nvarchar(10));
                      " + deleteHolds + @"
                      UPDATE Seats SET IsAvailable = 1
                      WHERE SeatId IN (SELECT SeatId FROM @Released)
                        AND SeatId NOT IN (SELECT SeatId FROM BookingSeat WHERE SeatId IS NOT NULL);
                      COMMIT;", con);
                cmd.Parameters.AddWithValue(parameterName, parameterValue);
                cmd.ExecuteNonQuery();
            }
        }
    }
}
