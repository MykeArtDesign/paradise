/* eslint-disable class-methods-use-this */
import { API } from './index';

class DestinationDataService {
  getAll() {
    return API.get('/destinations');
  }
  get(id) {
    return API.get(`/destinations/${id}`);
  }
  create(data) {
    return API.post('/destinations', data);
  }
  update(id, data) {
    return API.put(`/destinations/${id}`, data);
  }
  delete(id) {
    return API.delete(`/destinations/${id}`);
  }
  deleteAll() {
    return API.delete('/destinations');
  }
}
export default new DestinationDataService();
