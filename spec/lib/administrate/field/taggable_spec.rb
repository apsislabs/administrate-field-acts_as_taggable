require 'spec_helper'
require 'acts-as-taggable-on'

describe Administrate::Field::ActsAsTaggable do
  let(:data) { tags }
  let(:options) { {} }
  let(:context) { :categories }

  let(:tags) do
    [
      class_double("ActsAsTaggableOn::Tag", name: 'Tag One'),
      class_double("ActsAsTaggableOn::Tag", name: 'Tag Two'),
      class_double("ActsAsTaggableOn::Tag", name: 'Tag Three'),
    ]
  end

  context 'data' do
    subject { described_class.new(context, data, :form) }
    before { allow(subject).to receive(:options).and_return(options) }

    describe '#context' do
      it 'returns the context' do
        expect(subject.context).to eq context
      end

      it 'returns context if overridden' do
        sub = described_class.new(:override, data, :show)
        allow(sub).to receive(:options).and_return(options)

        expect(sub.context).to eq :override
      end
    end

    describe '#attribute' do
      it 'returns the list version of the context' do
        expect(subject.attribute).to eq "#{context.to_s.singularize}_list"
      end
    end

    describe '#tags' do
      it 'returns the list of tags' do
        expect(subject.tags).to eq tags
      end
    end

    describe '#name' do
      it 'returns the context as a string' do
        expect(subject.name).to eq context.to_s
      end
    end

    describe '#delimitted' do
      before { tags.each { |t| allow(t).to receive(:to_s).and_return(t.name) } }

      it 'returns a comma-delimitted version of the data' do
        expect(subject.delimitted).to eq tags.join(', ')
      end

      it 'returns tag names as a comma-separated string' do
        expect(subject.delimitted).to eq 'Tag One, Tag Two, Tag Three'
      end
    end

    describe '#tag_options' do
      before do
        allow(ActsAsTaggableOn::Tag).to receive(:for_context).and_return(tags)
        allow(tags).to receive(:order).and_return(tags)
      end

      it 'returns an array hashes' do
        expect(ActsAsTaggableOn::Tag).to receive(:for_context).with(context)
        expect(subject.tag_options).to include(hash_including(text: 'Tag One', value: 'Tag One'))
      end
    end
  end

  context 'views' do
    context 'show' do
      subject { described_class.new(context, data, :show) }

      describe '#to_partial_path' do
        it 'returns a partial based on the page being rendered' do
          expect(subject.to_partial_path).to eq('/fields/acts_as_taggable/show')
        end
      end
    end

    context 'form' do
      subject { described_class.new(:categories, data, :form) }

      describe '#to_partial_path' do
        it 'returns a partial based on the page being rendered' do
          expect(subject.to_partial_path).to eq('/fields/acts_as_taggable/form')
        end
      end
    end

    context 'index' do
      subject { described_class.new(:categories, data, :index) }

      describe '#to_partial_path' do
        it 'returns a partial based on the page being rendered' do
          expect(subject.to_partial_path).to eq('/fields/acts_as_taggable/index')
        end
      end
    end
  end
end
