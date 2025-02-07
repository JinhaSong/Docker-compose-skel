# Docker-compose-skel

## 사용 방법
### docker-compose.yml 수정 방법
```
version: '2.3'

services:
  dev:                                   # 서비스 이름 수정
    container_name: dev                  # 컨테이너 이름 수정
    runtime: nvidia
    restart: always
    build:
      context: ./                        # 해당 docker container의 빌드 시 참조할 기본경로의 위치
      dockerfile: docker/dev/dockerfile  # 해당 docker container의 빌드 시 사용되는 dockerfile
    env_file:
      - "docker/env.env"                 # docker container의 환경변수 설정 파일(기본적으로 NVIDIA_VISIBLE_DEVISES=all로 설정)
    volumes:
      - ${PWD}:/workspace                # docker container에 접근 시 연결되는 기본 경로
    ports:
      - "10000:8000"
      - "10022:22"
    stdin_open: true
    tty: true

volumes:
  dataset:
    driver: local
    driver_opts:
      type: none
      device: /media/hdd/dataset
      o: bind
```
- 주석이 작성된 부분 이외에는 기본적으로 필요한 값이니 별도의 수정은 하지 말 것
- volumes에 NFS로 네트워크 볼륨 추가가 필요할 경우 docker-compose.yml.backup 참고
- 이외에 빌드에 필요한 사항은 docker/dev/dockerfile를 수정하여 사용
