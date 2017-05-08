const topicsArray = topics => {
  let cityNames = Object.keys(topics).map((id) => {
    return topics[id].name;
  });

  cityNames = cityNames.sort()
  return cityNames;
}

export default topicsArray;
