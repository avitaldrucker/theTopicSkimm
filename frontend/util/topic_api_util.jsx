export const fetchTopics = (version, type) => {
  return fetch(`/v${version}/topics/${type}`);
};
