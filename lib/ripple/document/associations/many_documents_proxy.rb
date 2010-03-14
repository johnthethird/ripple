module Ripple
  module Document
    module Associations
      class ManyDocumentsProxy < Collection
        
        #Walk all links and return documents
        def all
          a = []
          klass.find(owner.instance_variable_get(:@robject).walk(:bucket => reflection.instance_variable_get(:@name).to_s,:tag => "many").flatten.collect {|x| x.key })
        end
        
        def <<(docs)
          if docs.kind_of? Array
            docs.each do |doc|
              owner.instance_variable_get(:@robject).links << doc.instance_variable_get(:@robject).to_link("many")
            end
          else
            owner.instance_variable_get(:@robject).links << docs.instance_variable_get(:@robject).to_link("many")
          end
          reset
        end
        
        protected
        
        def find_target
          all
        end
      end
    end
  end
end