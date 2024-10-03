FROM node:22-alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
# After running npm run build, 
# your React application is transformed into static files 
RUN npm run build



FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html