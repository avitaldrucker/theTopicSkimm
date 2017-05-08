export const fetchTopics = (version, type) => {
  const url = `/v${version}/topics/${type}`
  return fetch(url);
};
