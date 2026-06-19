# freerdp-novnc

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Docker Image Version](https://img.shields.io/docker/v/lasuillard/freerdp-novnc?sort=semver)](https://hub.docker.com/r/lasuillard/freerdp-novnc)

Docker image for FreeRDP client through noVNC.

![Demo](docs/demo.png)

## ✨ Features

> [!NOTE]
> It is recommended to use existing RDP clients for more advanced scenarios. This image is intended for simple use cases.

- **Web-based UI**: Access to a remote server through FreeRDP over the web UI (noVNC)

## 🚀 How to use

You can try this image with Docker Compose by simply checking it out and running `docker compose up --build`. For more details, please check `docker-compose.yaml` file.

To pull and run the image from [Docker Hub](https://hub.docker.com/r/lasuillard/freerdp-novnc), run:

```bash
$ docker run --rm \
    -p 127.0.0.1:8080:8080 \
    -e DISPLAY_WIDTH=1024 \
    -e DISPLAY_HEIGHT=768 \
    -e RDP_HOST=host \
    -e RDP_USERNAME=username \
    -e RDP_PASSWORD=password \
    lasuillard/freerdp-novnc:main
```

Then open a browser and go to http://localhost:8080 to access noVNC.

### ⚙️ Environment variables

| Key | Description |
| --- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `DISPLAY_WIDTH` | noVNC display width. Defaults to `1024`. |
| `DISPLAY_HEIGHT` | noVNC display height. Defaults to `768`. |
| `RDP_HOST` | Remote RDP host. **Required**. |
| `RDP_PORT` | Remote RDP port. Defaults to `3389`. |
| `RDP_USERNAME` | Remote RDP username. **Required**. |
| `RDP_PASSWORD` | Remote RDP password. **Required**. |
| `RDP_ARGUMENTS` | Arguments to pass to FreeRDP CLI (`xfreerdp3`). Defaults to `/cert:ignore /dynamic-resolution`. |

## 💖 Contributing

Please refer to [CONTRIBUTING.md](./CONTRIBUTING.md) for more information on how to contribute to this project.

## 📜 License

This project is licensed under the MIT License.
