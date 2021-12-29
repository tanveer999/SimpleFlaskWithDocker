1. Command to install requirements
    ```
    pip install -r requirements.txt
    ```

2. Build docker image
    ```
    docker build -t tan66/simple-flask:v1 .
    ```
    
3. Run docker image
    ```
    docker run -d --name simpleflask -p 8080:8080 -e USER=tanveer tan66/simple-flask:v1
    ```