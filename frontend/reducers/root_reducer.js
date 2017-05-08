import TopicsReducer from './topics_reducer';
import { combineReducers } from 'redux';

export default combineReducers({
  topics: TopicsReducer
});
