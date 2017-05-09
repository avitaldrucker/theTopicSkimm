const topicsArray = topics => {
  return Object.keys(topics).map((id) => (topics[id].name)).sort();
}

export default topicsArray;
