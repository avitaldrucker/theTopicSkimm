import React from 'react';
import Header from './header';
import Menu from './menu';
import TopicsIndex from './topics_index';
import Footer from './footer';

const App = () => {
  return(
    <main>
      <Header />
      <Menu />
      <TopicsIndex />
      <Footer />
    </main>
  );
};

export default App;
