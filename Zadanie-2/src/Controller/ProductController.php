<?php
namespace App\Controller;

use App\Entity\Product;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\{JsonResponse, Request};
use Symfony\Component\Routing\Annotation\Route;

#[Route('/api/products')]
class ProductController extends AbstractController
{
    #[Route('', methods: ['GET'])]
    public function index(EntityManagerInterface $em): JsonResponse {
        $products = $em->getRepository(Product::class)->findAll();
        return $this->json(array_map(fn($p) => ['id' => $p->getId(), 'name' => $p->getName(), 'price' => $p->getPrice(), 'category' => $p->getCategory()], $products));
    }

    #[Route('/{id}', methods: ['GET'])]
    public function show(int $id, EntityManagerInterface $em): JsonResponse
    {
        $product = $em->getRepository(Product::class)->find($id);

        if (!$product) {
            return $this->json(['error' => 'Product not found'], 404);
        }

        return $this->json([
            'id' => $product->getId(),
            'name' => $product->getName(),
            'price' => $product->getPrice(),
            'category' => $product->getCategory()
        ]);
    }

    #[Route('', methods: ['POST'])]
    public function create(Request $request, EntityManagerInterface $em): JsonResponse {
        $data = json_decode($request->getContent(), true);
        $product = (new Product())->setName($data['name'])->setPrice($data['price'])->setCategory($data['category']);
        $em->persist($product);
        $em->flush();
        return $this->json(['id' => $product->getId()], 201);
    }

    #[Route('/{id}', methods: ['PUT'])]
    public function update(int $id, Request $request, EntityManagerInterface $em): JsonResponse {
        $product = $em->getRepository(Product::class)->find($id);
        if (!$product) return $this->json(['error' => 'Not found'], 404);
        $data = json_decode($request->getContent(), true);
        $product->setName($data['name'] ?? $product->getName())->setPrice($data['price'] ?? $product->getPrice())->setCategory($data['category'] ?? $product->getCategory());
        $em->flush();
        return $this->json(['message' => 'Updated']);
    }

    #[Route('/{id}', methods: ['DELETE'])]
    public function delete(int $id, EntityManagerInterface $em): JsonResponse {
        $product = $em->getRepository(Product::class)->find($id);
        if ($product) { $em->remove($product); $em->flush(); }
        return $this->json(['message' => 'Deleted']);
    }
}
