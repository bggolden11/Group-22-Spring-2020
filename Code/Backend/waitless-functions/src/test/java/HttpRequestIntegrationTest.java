import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.junit.jupiter.api.*;


import java.io.IOException;


/**
 * ! These tests are to be run on dev side only. Used for verifying functions work on local host.
 */


public class HttpRequestIntegrationTest {

    @Test
    public void getAllEmployees_Test() throws IOException {
        HttpUriRequest request = new HttpGet("http://localhost:7071/api/Get-All-Employees");

        HttpResponse httpResponse = HttpClientBuilder.create().build().execute(request);

        assert(httpResponse.getStatusLine().getStatusCode() == HttpStatus.SC_OK);

    }

    @Test
    public void authenticateUser_Test() throws IOException {
        CloseableHttpClient client = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost("http://localhost:7071/api/Authenticate-User");
        StringEntity entity = new StringEntity("{\n" +
                "\"employeeID\":\"2121\",\n" +
                "\"passwordtoken\":\"5z0ZYrqhDOm5nkK5oIEudg==\"\n" +
                "}");
        httpPost.setEntity(entity);
        httpPost.setHeader("Accept", "application/json");
        httpPost.setHeader("Content-type", "application/json");

        CloseableHttpResponse response = client.execute(httpPost);
        assert(response.getStatusLine().getStatusCode() == 200);
        client.close();
    }

    @Test
    public void createTask_Test() throws IOException {
        CloseableHttpClient client = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost("http://localhost:7071/api/Create-Task");
        StringEntity entity = new StringEntity("{\n" +
                "\temployeeId: \"2121\",\n" +
                "\ttitle: \"Please work\",\n" +
                "\tdescription:\"PLEAH\",\n" +
                "\ttable:\"A1\"\n" +
                "}");
        httpPost.setEntity(entity);
        httpPost.setHeader("Accept", "application/json");
        httpPost.setHeader("Content-type", "application/json");

        CloseableHttpResponse response = client.execute(httpPost);
        assert(response.getStatusLine().getStatusCode() == 201);
        client.close();
    }

    @Test
    public void AddUser_Test() throws IOException {
        CloseableHttpClient client = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost("http://localhost:7071/api/Add-User");
        StringEntity entity = new StringEntity("{\n" +
                "    \"firstName\": \"Chris P the third.\",\n" +
                "    \"lastName\": \"Bacon the second\",\n" +
                "    \"birthday\": \"2001-12-12\",\n" +
                "    \"address\": \"123 drive\",\n" +
                "    \"phone\": \"111-111-111\",\n" +
                "    \"title\": \"Boss\",\n" +
            "        \"encryptedPassword\": \"TestPassword\"\n" +
                "}");
        httpPost.setEntity(entity);
        httpPost.setHeader("Accept", "application/json");
        httpPost.setHeader("Content-type", "application/json");

        CloseableHttpResponse response = client.execute(httpPost);
        assert(response.getStatusLine().getStatusCode() == 200);
        client.close();
    }

    @Test
    public void getUncompletedTasksBasedOnEmployeeID_Test() throws IOException {
        CloseableHttpClient client = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost("http://localhost:7071/api/Get-Active-Tasks-Based-On-User");
        StringEntity entity = new StringEntity("{ employeeId: \"2130\"}\n");
        httpPost.setEntity(entity);
        httpPost.setHeader("Accept", "application/json");
        httpPost.setHeader("Content-type", "application/json");

        CloseableHttpResponse response = client.execute(httpPost);
        assert(response.getStatusLine().getStatusCode() == 200);
        client.close();
    }

    @Test
    public void getCompletedTasksBasedOnEmployeeID_Test() throws IOException {
        CloseableHttpClient client = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost("http://localhost:7071/api/Get-Inactive-Tasks-Based-On-User");
        StringEntity entity = new StringEntity("{ employeeId: \"2130\"}\n");
        httpPost.setEntity(entity);
        httpPost.setHeader("Accept", "application/json");
        httpPost.setHeader("Content-type", "application/json");

        CloseableHttpResponse response = client.execute(httpPost);
        assert(response.getStatusLine().getStatusCode() == 200);
        client.close();
    }

    @Test
    public void getEmployee_Test() throws IOException {
        CloseableHttpClient client = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost("http://localhost:7071/api/Get-Employee");
        StringEntity entity = new StringEntity("{ employeeId: \"2130\"}\n");
        httpPost.setEntity(entity);
        httpPost.setHeader("Accept", "application/json");
        httpPost.setHeader("Content-type", "application/json");

        CloseableHttpResponse response = client.execute(httpPost);
        assert(response.getStatusLine().getStatusCode() == 200);
        client.close();
    }

    @Test
    public void logUserOut_Test() throws IOException {
        CloseableHttpClient client = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost("http://localhost:7071/api/Log-User-Out");
        StringEntity entity = new StringEntity("{ employeeId: \"2130\"}\n");
        httpPost.setEntity(entity);
        httpPost.setHeader("Accept", "application/json");
        httpPost.setHeader("Content-type", "application/json");

        CloseableHttpResponse response = client.execute(httpPost);
        assert(response.getStatusLine().getStatusCode() == 200);
        client.close();
    }

    @Test
    public void updateTaskUser_Test() throws IOException {
        CloseableHttpClient client = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost("http://localhost:7071/api/Update-Task-User");
        StringEntity entity = new StringEntity("{\n" +
                "\ttaskId: \"1234\",\n" +
                "\temployeeToAssignId: \"2130\"\n" +
                "}");
        httpPost.setEntity(entity);
        httpPost.setHeader("Accept", "application/json");
        httpPost.setHeader("Content-type", "application/json");

        CloseableHttpResponse response = client.execute(httpPost);
        assert(response.getStatusLine().getStatusCode() == 200);
        client.close();
    }

    @Test
    public void finishTask_Test() throws IOException {
        CloseableHttpClient client = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost("http://localhost:7071/api/Finish-Task");
        StringEntity entity = new StringEntity("{\n" +
                "\ttaskID: \"1001\"\n" +
                "}");
        httpPost.setEntity(entity);
        httpPost.setHeader("Accept", "application/json");
        httpPost.setHeader("Content-type", "application/json");

        CloseableHttpResponse response = client.execute(httpPost);
        assert(response.getStatusLine().getStatusCode() == 200);
        client.close();
    }

    @Test
    public void getAllDiningTables_Test() throws IOException {
        HttpUriRequest request = new HttpGet("http://localhost:7071/api/Get-All-Dining-Tables");

        HttpResponse httpResponse = HttpClientBuilder.create().build().execute(request);

        assert(httpResponse.getStatusLine().getStatusCode() == HttpStatus.SC_OK);

    }

    @Test
    public void getAllTasks_Test() throws IOException {
        HttpUriRequest request = new HttpGet("http://localhost:7071/api/Get-All-Tasks");

        HttpResponse httpResponse = HttpClientBuilder.create().build().execute(request);

        assert(httpResponse.getStatusLine().getStatusCode() == HttpStatus.SC_OK);

    }

    @Test
    public void getTasksStats_Test() throws IOException {
        HttpUriRequest request = new HttpGet("http://localhost:7071/api/Get-Statistics-For-Tasks");

        HttpResponse httpResponse = HttpClientBuilder.create().build().execute(request);

        assert(httpResponse.getStatusLine().getStatusCode() == HttpStatus.SC_OK);

    }


}
