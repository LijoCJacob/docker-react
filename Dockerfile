FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# The next FROM command stops the previous FROM command flow.
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# The default command of the nginx will start the nginx server.