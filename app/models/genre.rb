class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '経済' },
    { id: 3, name: '政治' },
    { id: 4, name: '地域' },
    { id: 5, name: '国際' },
    { id: 6, name: 'IT' },
    { id: 7, name: 'エンタメ' },
    { id: 8, name: 'スポーツ' },
    { id: 9, name: 'グルメ' },
    { id: 10, name: 'その他' }
  ]
 
   include ActiveHash::Associations
   has_many :articles
 
  end

  class Month < ActiveHash::Base
    self.data = [
      { id: 1, name: '--' },
      { id: 2, name: '1' },
      { id: 3, name: '2' },
      { id: 4, name: '3' },
      { id: 5, name: '4' },
      { id: 6, name: '5' },
      { id: 7, name: '6' },
      { id: 8, name: '7' },
      { id: 9, name: '8' },
      { id: 10, name: '9' }
      { id: 10, name: '10' }
      { id: 10, name: '11' }
      { id: 10, name: '12' }
    ]
   
     include ActiveHash::Associations
     has_many :articles
   
    end