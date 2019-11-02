class Entity
{
  int id;
}

class Component
{

}

class Service
{
  void update( dt)
  {

  }
}

class EntityType
{

}

class Manager
{
  Entity createEntity(EntityType entityType)
  {
    return new Entity();
  }

  

}