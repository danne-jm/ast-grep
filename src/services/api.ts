// Dummy TypeScript file to demonstrate rename-service.yml codemod
// This file contains the old function call pattern that will be updated

export class ApiService {
  private baseUrl: string;
  private authToken: string;

  constructor(baseUrl: string, token: string) {
    this.baseUrl = baseUrl;
    this.authToken = token;
  }

  // Old pattern: oldServiceCall(url, token)
  // This should be transformed to: newServiceCall(token, url)
  async fetchData() {
    const url = `${this.baseUrl}/api/data`;
    const token = this.authToken;
    
    // This will be replaced by the codemod
    const response = await oldServiceCall(url, token);
    return response.json();
  }

  async getUserInfo(userId: string) {
    const endpoint = `${this.baseUrl}/users/${userId}`;
    
    // Another instance to be replaced
    return oldServiceCall(endpoint, this.authToken);
  }

  async postData(data: any) {
    const apiUrl = `${this.baseUrl}/api/submit`;
    
    // One more instance
    return oldServiceCall(apiUrl, this.authToken);
  }
}

// Placeholder for the old function (to be renamed)
async function oldServiceCall(url: string, token: string) {
  return fetch(url, {
    headers: {
      'Authorization': `Bearer ${token}`
    }
  });
}

// The new function signature (parameters swapped)
async function newServiceCall(token: string, url: string) {
  return fetch(url, {
    headers: {
      'Authorization': `Bearer ${token}`
    }
  });
}
