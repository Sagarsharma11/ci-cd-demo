# Step 1: Use a base Node.js image
FROM node:20-alpine

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy package.json and package-lock.json (if available) to the container
COPY package*.json ./

# Step 4: Install dependencies
RUN npm install

# Step 5: Install nodemon globally
RUN npm install -g nodemon

# Step 6: Copy the rest of the application files
COPY . .

# Step 7: Expose the port your app runs on
EXPOSE 8000

# Step 8: Define the command to run the app
CMD ["nodemon", "app.js"]

