<?php
namespace App\Controller;

use App\Entity\Product;
use App\Entity\Category;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\{JsonResponse, Request};
use Symfony\Component\Routing\Annotation\Route;

#[Route('/api/products')]
class ProductController extends AbstractController
{
    #[Route('', methods: ['GET'])]
    public function index(Request $request, EntityManagerInterface $em): JsonResponse 
    {
        $categoryName = $request->query->get('category');
        $repo = $em->getRepository(Product::class);

        if ($categoryName) {
            $category = $em->getRepository(Category::class)->findOneBy(['name' => $categoryName]);
            if (!$category) {
                return $this->json([]);
            }
            $products = $repo->findBy(['category' => $category]);
        } else {
            $products = $repo->findAll();
        }

        return $this->json(array_map(fn($p) => [
            'id' => $p->getId(),
            'name' => $p->getName(),
            'price' => $p->getPrice(),
            'category' => $p->getCategory() ? [
                'id' => $p->getCategory()->getId(),
                'name' => $p->getCategory()->getName()
            ] : null
        ], $products));
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
            'category' => $product->getCategory() ? [
                'id' => $product->getCategory()->getId(),
                'name' => $product->getCategory()->getName()
            ] : null
        ]);
    }

    #[Route('', methods: ['POST'])]
    public function create(Request $request, EntityManagerInterface $em): JsonResponse {
        $data = json_decode($request->getContent(), true);
        $product = (new Product())->setName($data['name'])->setPrice($data['price']);

        if (!empty($data['category'])) {
            $category = $em->getRepository(Category::class)->find($data['category']);
            if ($category) {
                $product->setCategory($category);
            }
        }

        $em->persist($product);
        $em->flush();

        return $this->json(['id' => $product->getId()], 201);
    }

    #[Route('/{id}', methods: ['PUT'])]
    public function update(int $id, Request $request, EntityManagerInterface $em): JsonResponse {
        $product = $em->getRepository(Product::class)->find($id);
        if (!$product) return $this->json(['error' => 'Not found'], 404);
        $data = json_decode($request->getContent(), true);
        $product->setName($data['name'] ?? $product->getName())->setPrice($data['price'] ?? $product->getPrice());
        if (!empty($data['category'])) {
            $category = $em->getRepository(Category::class)->find($data['category']);
            if ($category) {
                $product->setCategory($category);
            }
        }
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
