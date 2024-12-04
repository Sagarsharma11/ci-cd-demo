# Step 1: Use a base Node.js image
FROM node:20-alpine

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy package.json and package-lock.json (if available) to the container
COPY package*.json ./

# Step 4: Install dependencies
RUN npm install

# Step 5: Copy the rest of the application files
COPY . .

# Step 6: Expose the port your app runs on
EXPOSE 8000

# Step 7: Define the command to run the app
CMD ["nodemon", "app.js"]
