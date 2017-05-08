import * as TopicAPIUtil from '../util/topic_api_util';

export const RECEIVE_TOPICS = "RECEIVE_TOPICS";

export const receiveTopics = (topics) => {
  return {
    type: RECEIVE_TOPICS,
    topics: topics
  }
};

export const fetchTopics = (version, type) => {
  return (dispatch) => {
    return TopicAPIUtil
      .fetchTopics(version, type)
      .then((res) => (res.text()))
      .then((json) => {
        const topics = JSON.parse(json);
        return dispatch(receiveTopics(topics));
      });
  }
};
