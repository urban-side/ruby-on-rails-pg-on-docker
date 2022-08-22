FactoryBot.define do
  factory :task do
    title       {"test FB"}
    description {"test data created by FactoryBot"}
    status      {1}
    date        {"2022-08-03 10:00:00"}
    priority    {3}
    label       {0}
    user        {0}
  end
end
