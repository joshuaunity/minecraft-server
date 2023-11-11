# Use the official OpenJDK image as the base image
FROM openjdk:22-slim

# Set environment variables
ENV MINECRAFT_VERSION=1.20.2
ENV SERVER_JAR=server.${MINECRAFT_VERSION}.jar

# Create a directory for the Minecraft server and set it as the working directory
RUN mkdir /minecraft
WORKDIR /minecraft

# Copy the server JAR into the container
COPY ${SERVER_JAR} server.jar

# Accept the Minecraft EULA
RUN echo "eula=true" > eula.txt

# Expose the Minecraft server port
EXPOSE 25565

# Start the Minecraft server
CMD ["java", "-Xmx2G", "-Xms1G", "-jar", "server.jar", "nogui"]
