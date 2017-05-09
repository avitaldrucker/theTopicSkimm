import { combineReducers } from 'redux';
import TopicsReducer from './topics_reducer';

export default combineReducers({
  topics: TopicsReducer
});
