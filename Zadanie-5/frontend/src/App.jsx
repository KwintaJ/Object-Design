import React from 'react';
import { BrowserRouter as Router, Routes, Route, Link } from 'react-router-dom'; 

import { ShopProvider } from './context/ShopContext';
import Products from './components/Products';
import Payments from './components/Payments';
import Carts from './components/Carts';

function App() {
  return (
    <ShopProvider>
      <Router>
        <div className="App">
          
          <header style={{ 
            padding: '20px', 
            background: '#AAAAAA', 
            display: 'flex', 
            justifyContent: 'space-between', 
            alignItems: 'center' 
          }}>
            <Link to="/" style={{ textDecoration: 'none', color: 'inherit' }}>
              <h1 style={{ margin: 0 }}>Sklep KompuPRO</h1>
            </Link>

            <nav style={{ display: 'flex', gap: '20px' }}>
              <Link to="/" style={linkStyle}>Produkty</Link>
              <Link to="/cart" style={linkStyle}>Koszyk</Link>
              <Link to="/payment" style={linkStyle}>Płatność</Link>
            </nav>
          </header>

          <main style={{ padding: '20px' }}>
            <Routes>
              <Route path="/" element={<Products />} />
              <Route path="/cart" element={<Carts />} />
              <Route path="/payment" element={<Payments />} />
            </Routes>
          </main>

        </div>
      </Router>
    </ShopProvider>
  );
}

const linkStyle = {
  textDecoration: 'none',
  color: '#333',
  fontWeight: 'bold',
  padding: '10px 15px',
  backgroundColor: '#fff',
  borderRadius: '5px'
};

export default App;