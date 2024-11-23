# Zerops x Phoenix
This is a Phoenix application running on [Zerops](https://zerops.io) — built with Phoenix 1.7 and Elixir 1.16, featuring LiveView and PostgreSQL integration.

![phoenix](https://github.com/zeropsio/recipe-shared-assets/blob/main/covers/svg/cover-phoenix.svg)

<br />

## Deploy on Zerops
You can either click the deploy button to deploy directly on Zerops, or manually copy the [import yaml](zerops.yml) to the import dialog in the Zerops app.

[![Deploy on Zerops](https://github.com/zeropsio/recipe-shared-assets/blob/main/deploy-button/green/deploy-button.svg)](https://app.zerops.io/recipe/elixir)

<br/>

## Recipe features
- **Phoenix 1.7** with **LiveView** for real-time features
- **PostgreSQL** database integration with **Ecto**
- Built with **Bandit** HTTP server (referenced in config/config.exs)
- Asset bundling with **esbuild** and **Tailwind**
- Email support via **Swoosh**
- Health check endpoint at `/status`
- JSON handling with **Jason**

<br/>

## Project Structure
The application consists of:
- Phoenix Router handling incoming requests
- Database integration using Ecto
- LiveView for real-time features
- Asset pipeline with esbuild and Tailwind
- Email handling with Swoosh

Key endpoints:
- `GET /` - Main application entry
- `GET /status` - Health check endpoint
- `/live` - LiveView routes

<br/>

## Production vs. Development
Base of the recipe is ready for production. For production deployment, consider:

- Using highly available version of the PostgreSQL database (change `mode` from `NON_HA` to `HA` in recipe YAML)
- Using at least two containers for the Phoenix service (add `minContainers: 2` in recipe YAML)

Futher things to think about when running more complex, highly available pHOENIX production apps on Zerops:

- containers are volatile - use Zerops object storage to store your files
- Implement Redis (Valkey) for caching and session management

<br/>
<br/>

Need help setting your project up? Join [Zerops Discord community](https://discord.com/invite/WDvCZ54).