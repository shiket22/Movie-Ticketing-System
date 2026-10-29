using System;
using System.Security.Cryptography;

namespace Movie_Ticketing_System
{
    // Passwords are stored as "PBKDF2$iterations$salt$hash" (salt and hash in Base64), never as plain text
    public static class PasswordHasher
    {
        private const int SaltSize = 16;
        private const int HashSize = 32;
        private const int Iterations = 210000;

        public static string Hash(string password)
        {
            byte[] salt = new byte[SaltSize];
            using (RandomNumberGenerator rng = RandomNumberGenerator.Create())
            {
                rng.GetBytes(salt);
            }
            byte[] hash = Derive(password, salt, Iterations, HashSize);
            return "PBKDF2$" + Iterations + "$" + Convert.ToBase64String(salt) + "$" + Convert.ToBase64String(hash);
        }

        public static bool Verify(string password, string stored)
        {
            string[] parts = (stored ?? "").Split('$');
            int iterations;
            if (parts.Length != 4 || parts[0] != "PBKDF2" || !int.TryParse(parts[1], out iterations) || iterations < 1)
            {
                return false;
            }

            byte[] salt;
            byte[] expected;
            try
            {
                salt = Convert.FromBase64String(parts[2]);
                expected = Convert.FromBase64String(parts[3]);
            }
            catch (FormatException)
            {
                return false;
            }
            if (expected.Length == 0)
            {
                return false;
            }

            byte[] actual = Derive(password, salt, iterations, expected.Length);
            // Compare every byte, so the time taken doesn't reveal how much of the hash matched
            int difference = 0;
            for (int i = 0; i < expected.Length; i++)
            {
                difference |= expected[i] ^ actual[i];
            }
            return difference == 0;
        }

        private static byte[] Derive(string password, byte[] salt, int iterations, int length)
        {
            using (Rfc2898DeriveBytes pbkdf2 = new Rfc2898DeriveBytes(password, salt, iterations, HashAlgorithmName.SHA256))
            {
                return pbkdf2.GetBytes(length);
            }
        }
    }
}
