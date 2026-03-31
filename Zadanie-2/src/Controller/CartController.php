<?php
namespace App\Controller;

use App\Entity\Cart;
use App\Entity\Product;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\{JsonResponse, Request};
use Symfony\Component\Routing\Annotation\Route;

#[Route('/api/cart')]
class CartController extends AbstractController
{
    #[Route('', methods: ['GET'])]
    public function index(EntityManagerInterface $em): JsonResponse
    {
        $items = $em->getRepository(Cart::class)->findAll();
        $data = array_map(fn($item) => [
            'id' => $item->getId(),
            'quantity' => $item->getQuantity(),
            'product' => [
                'id' => $item->getProduct()->getId(),
                'name' => $item->getProduct()->getName(),
                'price' => $item->getProduct()->getPrice(),
            ]
        ], $items);

        return $this->json($data);
    }

    #[Route('', methods: ['POST'])]
    public function add(Request $request, EntityManagerInterface $em): JsonResponse
    {
        $content = $request->getContent();
        $data = json_decode($content, true);

        if (!$data || !isset($data['product_id'])) {
            return $this->json(['error' => 'Invalid JSON or missing product_id'], 400);
        }

        $productId = (int)$data['product_id'];
        $product = $em->getRepository(Product::class)->find($productId);

        if (!$product) {
            return $this->json(['error' => "Product with ID $productId not found!"], 404);
        }

        $existingItem = $em->getRepository(Cart::class)->findOneBy(['product' => $product]);

        if ($existingItem) {
            $existingItem->setQuantity($existingItem->getQuantity() + ($data['quantity'] ?? 1));
            $em->flush();
            return $this->json(['status' => 'Quantity updated']);
        }

        $cartItem = new Cart();
        $cartItem->setProduct($product);
        $cartItem->setQuantity($data['quantity'] ?? 1);

        $em->persist($cartItem);
        $em->flush();

        return $this->json([
            'id' => $cartItem->getId(),
            'product' => $product->getName(),
            'status' => 'Added to cart'
        ], 201);
    }

    #[Route('/{id}', methods: ['GET'])]
    public function show(Cart $cartItem): JsonResponse
    {
        return $this->json([
            'id' => $cartItem->getId(),
            'quantity' => $cartItem->getQuantity(),
            'product' => [
                'id' => $cartItem->getProduct()->getId(),
                'name' => $cartItem->getProduct()->getName()
            ]
        ]);
    }

    #[Route('/{id}', methods: ['PUT'])]
    public function update(Request $request, Cart $cartItem, EntityManagerInterface $em): JsonResponse
    {
        $data = json_decode($request->getContent(), true);
        
        if (isset($data['quantity'])) {
            $cartItem->setQuantity((int)$data['quantity']);
            $em->flush();
        }

        return $this->json(['status' => 'Quantity updated', 'new_quantity' => $cartItem->getQuantity()]);
    }

    #[Route('/{id}', methods: ['DELETE'])]
    public function remove(Cart $cartItem, EntityManagerInterface $em): JsonResponse
    {
        $em->remove($cartItem);
        $em->flush();

        return $this->json(['status' => 'Removed from cart']);
    }
}