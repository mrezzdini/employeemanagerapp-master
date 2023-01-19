# stage 1
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install --save --legacy-peer-deps
RUN npm run build --prod

# stage 2
FROM nginx:alpine
COPY --from=node build /app/dist/plantManagement /usr/share/nginx/html
EXPOSE 4200
CMD ["ng" ,"serve"]
