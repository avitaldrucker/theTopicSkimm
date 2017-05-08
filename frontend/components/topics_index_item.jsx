import React from 'react';

const TopicsIndexItem = ({ topic }) => {
  if (!topic) { return (<div className="topic empty"></div>); }
  return(<div className="topic full">{topic}</div>)
};

export default TopicsIndexItem;
