import React from 'react';
import { connect } from 'react-redux';
import topicsArray from '../selectors/topics_array';
import TopicsIndexItem from './topics_index_item';

const TopicsIndex = (props) => {
  const topicRows = [];
  const tiles = props.topics.map((topic, i) => {
    return(<TopicsIndexItem key={i} topic={topic} />);
  });

  let length = props.topics.length;
  while (length % 4 !== 0) {
    tiles.push(<TopicsIndexItem key={length} topic={undefined} />);
    length += 1;
  }


  return(<div className="topics">{tiles}</div>)
}


const mapStateToProps = state => {
  return {
    topics: topicsArray(state.topics)
  };
};

export default connect(mapStateToProps, null)(TopicsIndex);
