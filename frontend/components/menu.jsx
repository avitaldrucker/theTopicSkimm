import React from 'react';
import MenuIndexItem from './menu_index_item';
import { connect } from 'react-redux';

import { fetchTopics } from '../actions/topic_actions';


class Menu extends React.Component {

  constructor(props) {
    super(props);
    this.state = { version: null, type: null };
    this.fetchTopics = this.fetchTopics.bind(this);
  }

  fetchTopics(version, type) {
    return(e) => {
      this.props.fetchTopics(version, type);
      this.setState({ version: version, type: type });
    }
  }

  selected(buttonVersion, buttonType) {
    return  this.state.version == buttonVersion &&
            this.state.type == buttonType;
  }

  menuIndexItem(type, version, key) {
    let className = this.selected(version, type) ? "selected" : "";

    return(
      <MenuIndexItem
        fetchTopics={this.fetchTopics} className={className}
        key={key} type={type} version={version}/>
    );
  }


  render() {
    const buttons = [];
    const { type, version } = this.props;

    [1, 2].forEach((version, i) => {
      ["national", "world"].forEach((type, j) => {
        buttons.push(this.menuIndexItem(type, version, (i * 5) - j));
      });
    });

    return(<nav>{buttons}</nav>);
  }

}

const mapDispatchToProps = (dispatch) => {
  return {
    fetchTopics: (version, type) => {
      return dispatch(fetchTopics(version, type));
    }
  };
};

export default connect(null, mapDispatchToProps)(Menu);
