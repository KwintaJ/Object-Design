<?php
namespace App\Controller;

use App\Entity\Category;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\{JsonResponse, Request};
use Symfony\Component\Routing\Annotation\Route;

#[Route('/api/category')]
class CategoryController extends AbstractController
{
    #[Route('', methods: ['GET'])]
    public function index(EntityManagerInterface $em): JsonResponse {
        $categories = $em->getRepository(Category::class)->findAll();
        return $this->json(array_map(fn($p) => ['id' => $p->getId(), 'name' => $p->getName()], $categories));
    }

    #[Route('/{id}', methods: ['GET'])]
    public function show(int $id, EntityManagerInterface $em): JsonResponse
    {
        $category = $em->getRepository(Category::class)->find($id);

        if (!$category) {
            return $this->json(['error' => 'Category not found'], 404);
        }

        return $this->json([
            'id' => $category->getId(),
            'name' => $category->getName(),
        ]);
    }

    #[Route('', methods: ['POST'])]
    public function create(Request $request, EntityManagerInterface $em): JsonResponse {
        $data = json_decode($request->getContent(), true);
        $Category = (new Category())->setName($data['name']);
        $em->persist($Category);
        $em->flush();
        return $this->json(['id' => $Category->getId()], 201);
    }

    #[Route('/{id}', methods: ['PUT'])]
    public function update(int $id, Request $request, EntityManagerInterface $em): JsonResponse {
        $category = $em->getRepository(Category::class)->find($id);
        if (!$category) return $this->json(['error' => 'Not found'], 404);
        $data = json_decode($request->getContent(), true);
        $category->setName($data['name'] ?? $category->getName());
        $em->flush();
        return $this->json(['message' => 'Updated']);
    }

    #[Route('/{id}', methods: ['DELETE'])]
    public function delete(int $id, EntityManagerInterface $em): JsonResponse {
        $Category = $em->getRepository(Category::class)->find($id);
        if ($Category) { $em->remove($Category); $em->flush(); }
        return $this->json(['message' => 'Deleted']);
    }
}