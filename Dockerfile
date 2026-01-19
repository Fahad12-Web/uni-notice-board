FROM node:alpine AS app-build-stage
WORKDIR /app

# 1. Install dependencies
COPY package*.json ./
RUN npm install

# 2. Copy source files
COPY ./src ./src

# 3. Copy styles folder inside src
COPY ./styles ./src/styles

# 4. Build using Parcel
RUN npx parcel build "./src/*.html" --dist-dir "./dist" --public-url "./" --no-cache

# 5. Deploy stage
FROM nginx:alpine AS deploy-stage
COPY --from=app-build-stage /app/dist /usr/share/nginx/html
