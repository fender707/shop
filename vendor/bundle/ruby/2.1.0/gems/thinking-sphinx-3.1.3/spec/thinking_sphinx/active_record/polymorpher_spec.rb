require 'spec_helper'

describe ThinkingSphinx::ActiveRecord::Polymorpher do
  let(:polymorpher) { ThinkingSphinx::ActiveRecord::Polymorpher.new source,
    column, class_names }
  let(:source)      { double 'Source', :model => outer, :fields => [field],
    :attributes => [attribute] }
  let(:column)      { double 'Column', :__name => :foo, :__stack => [:a, :b],
    :__path => [:a, :b, :foo] }
  let(:class_names) { %w( Article Animal ) }
  let(:field)       { double :rebase => true }
  let(:attribute)   { double :rebase => true }
  let(:outer)       { double(
    :reflect_on_association => double(:klass => inner)) }
  let(:inner)       { double(
    :reflect_on_association => double(:klass => model)) }
  let(:model)       { double 'Model', :reflections => {},
    :reflect_on_association => reflection }
  let(:reflection)  { double 'Polymorphic Reflection' }

  describe '#morph!' do
    let(:article_reflection) { double 'Article Reflection' }
    let(:animal_reflection)  { double 'Animal Reflection' }

    before :each do
      ThinkingSphinx::ActiveRecord::FilterReflection.
        stub(:call).
        and_return(article_reflection, animal_reflection)

      model.stub(:reflect_on_association) do |name|
        name == :foo ? reflection : nil
      end

      if ActiveRecord::Reflection.respond_to?(:add_reflection)
        ActiveRecord::Reflection.stub :add_reflection
      end
    end

    it "creates a new reflection for each class" do
      ThinkingSphinx::ActiveRecord::FilterReflection.
        unstub :call

      ThinkingSphinx::ActiveRecord::FilterReflection.
        should_receive(:call).
        with(reflection, :foo_article, 'Article').
        and_return(article_reflection)
      ThinkingSphinx::ActiveRecord::FilterReflection.
        should_receive(:call).
        with(reflection, :foo_animal, 'Animal').
        and_return(animal_reflection)

      polymorpher.morph!
    end

    it "adds the new reflections to the end-of-stack model" do
      if ActiveRecord::Reflection.respond_to?(:add_reflection)
        ActiveRecord::Reflection.should_receive(:add_reflection).
          with(model, :foo_article, article_reflection)
        ActiveRecord::Reflection.should_receive(:add_reflection).
          with(model, :foo_animal, animal_reflection)

        polymorpher.morph!
      else
        polymorpher.morph!

        expect(model.reflections[:foo_article]).to eq(article_reflection)
        expect(model.reflections[:foo_animal]).to eq(animal_reflection)
      end
    end

    it "rebases each field" do
      field.should_receive(:rebase).with([:a, :b, :foo],
        :to => [[:a, :b, :foo_article], [:a, :b, :foo_animal]])

      polymorpher.morph!
    end

    it "rebases each attribute" do
      attribute.should_receive(:rebase).with([:a, :b, :foo],
        :to => [[:a, :b, :foo_article], [:a, :b, :foo_animal]])

      polymorpher.morph!
    end
  end
end
