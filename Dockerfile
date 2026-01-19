FROM node:alpine AS app-build-stage
WORKDIR /app

COPY package*.json ./
RUN npm install

# Poora code copy karein
COPY . .

# Ab build karein
RUN npx parcel build "./src/*.html" --dist-dir "./dist" --public-url "./" --no-cache

FROM nginx:alpine AS deploy-stage
COPY --from=app-build-stage /app/dist /usr/share/nginx/html