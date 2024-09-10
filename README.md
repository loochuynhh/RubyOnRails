
# Mostly Static Pages

This is the README for the **Mostly Static Pages** Ruby on Rails application. The application is built using Rails 7.2.0.beta2 and is designed to be a lightweight web app focused on serving static content. This document will guide you through the steps to get the application up and running, as well as provide details on the tools and technologies used.

## Prerequisites

Before setting up the application, ensure you have the following installed:

- **Ruby version**: `>= 3.0.0`
- **Rails version**: `~> 7.2.0.beta2`
- **Bundler**: `>= 2.1`
- **Node.js and Yarn** (for managing JavaScript dependencies)

## Setup Instructions

### 1. Clone the Repository

To start, clone the repository from GitHub:

```bash
git clone https://github.com/username/mostly_static_pages.git
cd mostly_static_pages
```

### 2. Install Dependencies

Ensure all required Ruby gems are installed by running:

```bash
bundle install
```

Then, install the necessary JavaScript dependencies (managed by Yarn):

```bash
yarn install
```

### 3. Configure the Database

By default, this application uses SQLite3. To set up the database, run:

```bash
rails db:create
rails db:migrate
```

If you are using a different database in production, update the `config/database.yml` file accordingly.

### 4. Running the Application

To start the Rails server and serve the static pages:

```bash
rails server
```

The application will be available at `http://localhost:3000`.

## Testing

The application uses **Capybara** and **Selenium WebDriver** for system testing. To run the test suite, use the following command:

```bash
rails test
```

You can also run system tests:

```bash
rails test:system
```

## Key Features and Technologies

### Gems

- **Rails**: `~> 7.2.0.beta2`
- **SQLite3**: Used as the default database for development.
- **Puma**: High-performance web server.
- **Importmap-Rails**: JavaScript management with ESM import maps.
- **Turbo-Rails**: For fast, SPA-like page updates without reloading.
- **Stimulus-Rails**: Simple JavaScript framework for Rails.
- **Jbuilder**: For building JSON APIs (optional).
- **Bootsnap**: Speeds up boot times by caching expensive operations.

### Development & Testing Tools

- **Web Console**: Provides an interactive console on error pages in development.
- **Debug**: Debugging tool for Ruby applications.
- **Brakeman**: Static analysis tool for identifying security vulnerabilities.
- **Rubocop Rails Omakase**: For code style enforcement in Rails.
- **Capybara**: System testing framework for simulating user interactions.
- **Selenium WebDriver**: Automated testing tool for browsers.

## Deployment Instructions

For production deployment, follow the steps below (adjust based on your hosting provider):

1. Ensure the `RAILS_ENV` is set to `production`.
2. Precompile assets:
   ```bash
   rails assets:precompile
   ```
3. Run database migrations:
   ```bash
   rails db:migrate RAILS_ENV=production
   ```
4. Start the server in production mode:
   ```bash
   rails server -e production
   ```

## Additional Configuration

### System Dependencies

Ensure your system has the following dependencies installed:

- Node.js and Yarn (for JavaScript assets management)
- Redis (if using Action Cable in production)
- ImageMagick (if using Active Storage for image variants)

### Environment Variables

For sensitive data like API keys or database credentials, use environment variables. You can set these in the `.env` file (don't forget to add `.env` to `.gitignore`):

```bash
DATABASE_USERNAME=your_username
DATABASE_PASSWORD=your_password
```

## Contributing

If you wish to contribute to this project, please follow the guidelines in the CONTRIBUTING.md file.

---

For more detailed documentation, refer to the official [Rails Guides](https://guides.rubyonrails.org/).