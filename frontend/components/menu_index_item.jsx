import React from 'react';


const MenuIndexItem = ({ type, version, fetchTopics, className }) => {
  const text = `${type} v. ${version}`.toUpperCase();

  return(
    <button className={className} onClick={fetchTopics(version, type)}>
      {text}
    </button>
  );
}

export default MenuIndexItem;
