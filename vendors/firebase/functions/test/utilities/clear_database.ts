import axios from "axios";

async function clearDatabase() {
  const response = await axios({
    method: "DELETE",
    baseURL: "http://localhost:8080/emulator/v1/",
    url: "/projects/iwfpapp/databases/(default)/documents",
  });
  return response.status;
}

export default clearDatabase;
