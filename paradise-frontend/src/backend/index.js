import axios from 'axios';

const API_URL = 'http://localhost:3000';

export const API = axios.create({
  baseURL: API_URL,
  headers: {
    'Content-Type': 'application/json',
  },
});


export function setSession(token) {
  if (token) {
    localStorage.setItem('jwt_access_token', token);
    axios.defaults.headers.common.Authorization = `Bearer ${token}`;
  } else {
    localStorage.removeItem('jwt_access_token');
    delete axios.defaults.headers.common.Authorization;
  }
}

export function signOut() {
  setSession(null);
}
