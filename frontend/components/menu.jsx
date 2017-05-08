import React from 'react';
import { fetchTopics } from '../actions/topic_actions';
import { connect } from 'react-redux';

const Menu = ({ fetchTopics }) => {
  const versions = [1, 2];
  const types = ["national", "world"];

  const buttons = [];

  versions.forEach((version, i) => {
    types.forEach((type, j) => {
      let text = `${type} v. ${version}`.toUpperCase();
      buttons.push(
        <button key={(i * 10) - j} onClick={fetchTopics(version, type)}>{text}</button>
      );
    });
  });

  return(
    <nav>
      {buttons}
    </nav>
  );
};

const mapDispatchToProps = (dispatch) => {
  return {
    fetchTopics: (version, type) => {
      return () => (dispatch(fetchTopics(version, type)));
    }
  };
};

export default connect(null, mapDispatchToProps)(Menu);
