import axios from 'axios';

const API_URL = 'http://localhost:3000';

export const API = axios.create({
  baseURL: API_URL,
  headers: {
    'Content-Type': 'application/json',
  },
});

export default function setSession(token) {
  if (token) {
    localStorage.setItem('jwt_access_token', token);
    API.defaults.headers.common.Authorization = `Bearer ${token}`;
  } else {
    localStorage.removeItem('jwt_access_token');
    delete API.defaults.headers.common.Authorization;
  }
}
