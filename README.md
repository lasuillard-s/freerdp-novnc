# freerdp-novnc

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Docker Image Version](https://img.shields.io/docker/v/lasuillard/freerdp-novnc?sort=semver)](https://hub.docker.com/r/lasuillard/freerdp-novnc)

Docker image for FreeRDP client with noVNC.

![Demo](docs/demo.png)

## ✨ Features

I built this image to provide access to remote server through noVNC for simple use cases. It is generally recommend to use existing RDP clients for more advanced use cases.

- Configure access to remote server through FreeRDP over web UI (noVNC)

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

Then open browser and go to http://localhost:8080 to access noVNC.

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
