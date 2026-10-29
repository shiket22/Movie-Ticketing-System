# Online Movie Ticketing System

A cinema booking web app built with ASP.NET Web Forms and SQL Server. It was a group project for the
Web Application Development course (BAIT2113) in 2024.

<!-- Screenshots: add them to docs/screenshots and list them here, for example
![Home page](docs/screenshots/home.png) -->

## Features

**Customers**
- Browse movies that are showing now or coming soon, search, and read each movie's details
- Register, log in, edit the profile and change the password
- Choose seats for a show time, add food and drinks, then pay from the cart
- See past bookings

**Admins**
- Add, edit and remove movies, halls (with their seats) and show times

## Tech

C#, ASP.NET Web Forms (.NET Framework 4.7.2), SQL Server LocalDB, HTML, CSS, JavaScript

## Security notes

- Every SQL statement uses parameters, so user input can't change a query.
- Passwords are hashed with PBKDF2-HMAC-SHA256 (210,000 iterations, a random salt per password; see
  `PasswordHasher.cs`). The original coursework stored them as plain text; hashing was added in 2026.
- The admin pages inherit from `AdminPage`, which sends anyone who isn't logged in as an admin to the login page.
- The payment page is a mock-up and saves the card number as typed. Never enter a real card number.

## Running it

1. Install Visual Studio 2022 with the **ASP.NET and web development** workload. It includes SQL Server
   Express LocalDB. If the .NET Framework 4.7.2 targeting pack is missing, Visual Studio offers to install it.
2. Open `Movie Ticketing System.sln` and build once. NuGet restores the packages.
3. Create the database:
   1. In Solution Explorer, right-click **App_Data** > **Add** > **New Item** > **SQL Server Database** and name
      it `MovieTicketingSystem.mdf`.
   2. In Server Explorer, right-click the new database > **New Query**. Paste `Database/schema.sql` and run it,
      then do the same with `Database/sample-data.sql`.
      Two warnings about a 900-byte key length are expected.
4. Press **F5** to run the site in IIS Express.

Demo accounts from the sample data:

| Role | Email | Password |
|---|---|---|
| Admin | admin@example.com | Admin1234 |
| Customer | customer@example.com | Customer123 |

The sample show times are from May 2024, so they appear in the past, and every movie counts as "now showing".
Add a movie with a later release date to see the "coming soon" page.

## Team

Built by a team of four students.

## Credits

Movie posters and brand logos belong to their owners. They are used here only for a non-commercial
university assignment.
