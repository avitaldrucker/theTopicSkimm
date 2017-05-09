import React from 'react';
import { connect } from 'react-redux';

import topicsArray from '../selectors/topics_array';
import TopicsIndexItem from './topics_index_item';


const TopicsIndex = ({ topics }) => {
  const topicRows = [];

  const tiles = topics.map((topic, i) => {
    return(<TopicsIndexItem key={i} topic={topic} />);
  });

  while (tiles.length % 4 !== 0) {
    tiles.push(<TopicsIndexItem key={tiles.length} topic={null} />);
  }

  return(<div className="topics">{tiles}</div>);
}


const mapStateToProps = state => {
  return {
    topics: topicsArray(state.topics)
  };
};


export default connect(mapStateToProps, null)(TopicsIndex);
