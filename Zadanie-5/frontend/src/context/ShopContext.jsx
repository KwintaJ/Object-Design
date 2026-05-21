import React, { createContext, useState, useContext, useEffect } from 'react';
import api from '../api/axios';

const ShopContext = createContext();

export const ShopProvider = ({ children }) => {
  const [items, setItems] = useState([]);
  const [total, setTotal] = useState(0);
  const [products, setProducts] = useState([]);
  const [cartID, setCartID] = useState(null);
  const [paymentStatus, setPaymentStatus] = useState('idle');

  const getSafeId = (id) => {
    const activeId = id || cartID;
    if (!activeId) return null;
    
    const parsedId = parseInt(activeId, 10);
    return isNaN(parsedId) ? null : parsedId;
  };

  const fetchCart = async (id) => {
    const safeId = getSafeCartId(id);
    if (!safeId) return;

    try {
      const res = await api.get(`/cart/${safeId}`);
      setItems(res.data.items || []);
      setTotal(res.data.total || 0);
    } catch (err) {
      if (err.response && err.response.status === 404) {
        newCart(); 
      } else {
        console.error("Błąd pobierania koszyka", err);
      }
    }
  };

  const fetchProducts = async () => {
    try {
      const res = await api.get('/products');
      setProducts(res.data);
    } catch (err) { console.error("Błąd pobierania produktów", err); }
  };

  const addToCart = async (product) => {
    const safeId = getSafeCartId();
    if (!safeId) return;

    try {
      const itemDetails = {
        product_id: product.ID,
        name: product.name,
        price: product.price,
        quantity: 1
      };

      await api.post(`/cart/${safeId}`, itemDetails);
      fetchCart(safeId);
    } catch (err) { console.error("Błąd dodawania do koszyka", err); }
  };

  const updateQty = async (itemID, newQty) => {
    const safeId = getSafeCartId();
    if (!safeId) return;

    try {
      const res = await api.put(`/cart/${safeId}/${itemID}`, { 
        quantity: parseInt(newQty) 
      });

      if (res.status === 200) {
        setItems(prevItems => 
          prevItems.map(item => item.ID === itemID ? { ...item, quantity: newQty } : item)
        );
      }
      fetchCart(safeId);
    } catch (err) { console.error("Błąd aktualizacji ilości", err); }
  };

  const removeFromCart = async (itemID) => {
    const safeId = getSafeCartId();
    if (!safeId) return;

    try {
      await api.delete(`/cart/${safeId}/${itemID}`);
      await fetchCart(safeId);
    } catch (err) { console.error("Błąd usuwania z koszyka", err); }
  };

  const handlePay = async (method) => {
    const safeId = getSafeCartId();
    if (!safeId) return;

    setPaymentStatus('processing');
    try {
      const paymentDetails = {
        amount: total,
        method: method,
        status: "",
        cart_id: safeId
      };

      const res = await api.post(`/payments`, paymentDetails);
      const payment = res.data;
      
      setTimeout(async () => {
        try {
          const parsedPaymentId = parseInt(payment?.ID, 10);
        
          if (!parsedPaymentId || isNaN(parsedPaymentId)) {
            console.error("Nieprawidłowe ID płatności odebrane z serwera");
            setPaymentStatus('error');
            return;
          }

          const finalizeRes = await api.put(`/payments/${parsedPaymentId}/completed`);

          if (finalizeRes.status === 200) {
            setPaymentStatus('success');
            newCart();
          } else {
            setPaymentStatus('error');
          }
        } catch (err) { setPaymentStatus('error'); }
      }, 2000);
      
    } catch (err) { setPaymentStatus('error'); }
  };

  const newCart = async () => {
    try {
      const res = await api.post('/cart');
      const data = res.data;

      setCartID(data.ID);
      setItems([]);
      setTotal(0);
      
      fetchCart(data.ID);
    } catch(err) { console.error("Błąd inicjalizacji koszyka", err); }
  }; 

  useEffect(() => {
    fetchProducts();
    newCart();
  }, []);

  return (
    <ShopContext.Provider value={{ 
      items, 
      total, 
      products,
      addToCart,
      updateQty, 
      removeFromCart,
      handlePay,
      paymentStatus
    }}>
      {children}
    </ShopContext.Provider>
  );
};

export const useShop = () => useContext(ShopContext);