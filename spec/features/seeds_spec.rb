require 'spec_helper'

describe '#Seed Data' do
  before(:all) { load Rails.root + 'db/seeds.rb' }
  after(:all) { DatabaseCleaner.clean_with(:truncation) }

  describe '#Groups' do
    specify 'should have 10 items' do
      Group.count.should eq 10
    end

    [['Group I', 2],
     ['Group II', 3],
     ['Group III', 4],
     ['Group IV', 1],
     ['Group V', 8],
     ['Group VI', 3],
     ['Group VII', 2],
     ['Group VIII', 3],
     ['Group IX', 11],
     ['Group X', 3],
    ].each do |name, count|
      it "#{name} should have #{count} sections" do
        Group.find_by(name: name).sections.count.should eq count
      end
    end
  end

  #######################
  # SECTIONS AND BREEDS #
  #######################
  describe '#Sections' do
    specify 'should have 40 items' do
      Section.count.should eq 40
    end

    # GROUP I #
    describe 'Group I' do
      # Section 1
      it 'Section 1 should have 0 subsections and 38 breeds' do
        Group.find_by(:name => 'Group I').sections.find_by(:name => 'Section 1').subsections.count.should eq 0
        Group.find_by(:name => 'Group I').sections.find_by(:name => 'Section 1').breeds.count.should eq 38
      end

      # Section 2
      it 'Section 2 should have 0 subsections and 3 breeds' do
        Group.find_by(:name => 'Group I').sections.find_by(:name => 'Section 2').subsections.count.should eq 0
        Group.find_by(:name => 'Group I').sections.find_by(:name => 'Section 2').breeds.count.should eq 3
      end
    end

    # GROUP II #
    ############
    describe 'Group II' do
      # Section 1
      it 'Section 1 should have 4 subsections' do
        Group.find_by(:name => 'Group II').sections.find_by(:name => 'Section 1').subsections.count.should eq 4
      end

      it 'Subsection 1 from Section 1 should have 5 breeds' do
        Group.find_by(:name => 'Group II').sections.find_by(:name => 'Section 1').
            subsections.find_by(:name => '1.1').breeds.count.should eq 5
      end

      it 'Subsection 2 from Section 1 should have 3 breeds' do
        Group.find_by(:name => 'Group II').sections.find_by(:name => 'Section 1').
            subsections.find_by(:name => '1.2').breeds.count.should eq 3
      end

      it 'Subsection 3 from Section 1 should have 1 breeds' do
        Group.find_by(:name => 'Group II').sections.find_by(:name => 'Section 1').
            subsections.find_by(:name => '1.3').breeds.count.should eq 1
      end

      it 'Subsection 4 from Section 1 should have 1 breeds' do
        Group.find_by(:name => 'Group II').sections.find_by(:name => 'Section 1').
            subsections.find_by(:name => '1.4').breeds.count.should eq 1
      end

      # Section 2
      it 'Section 2 should have 2 subsections and 1 breed' do
        Group.find_by(:name => 'Group II').sections.find_by(:name => 'Section 2').subsections.count.should eq 2
        Group.find_by(:name => 'Group II').sections.find_by(:name => 'Section 2').breeds.count.should eq 1
      end

      it 'Subsection 1 from Section 2 should have 16 breeds' do
        Group.find_by(:name => 'Group II').sections.find_by(:name => 'Section 2').
            subsections.find_by(:name => '2.1').breeds.count.should eq 16
      end

      it 'Subsection 2 from Section 2 should have 18 breeds' do
        Group.find_by(:name => 'Group II').sections.find_by(:name => 'Section 2').
            subsections.find_by(:name => '2.2').breeds.count.should eq 18
      end

      # Section 3
      it 'Section 3 should have 0 subsections and 4 breeds' do
        Group.find_by(:name => 'Group II').sections.find_by(:name => 'Section 3').subsections.count.should eq 0
        Group.find_by(:name => 'Group II').sections.find_by(:name => 'Section 3').breeds.count.should eq 4
      end
    end

    # GROUP III #
    #############
    describe 'Group III' do
      # Section 1
      it 'Section 1 should have 0 subsections and 15 breeds' do
        Group.find_by(:name => 'Group III').sections.find_by(:name => 'Section 1').subsections.count.should eq 0
        Group.find_by(:name => 'Group III').sections.find_by(:name => 'Section 1').breeds.count.should eq 15
      end

      # Section 2
      it 'Section 2 should have 0 subsections and 12 breeds' do
        Group.find_by(:name => 'Group III').sections.find_by(:name => 'Section 2').subsections.count.should eq 0
        Group.find_by(:name => 'Group III').sections.find_by(:name => 'Section 2').breeds.count.should eq 12
      end

      # Section 3
      it 'Section 3 should have 0 subsections and 4 breeds' do
        Group.find_by(:name => 'Group III').sections.find_by(:name => 'Section 3').subsections.count.should eq 0
        Group.find_by(:name => 'Group III').sections.find_by(:name => 'Section 3').breeds.count.should eq 4
      end

      # Section 4
      it 'Section 4 should have 0 subsections and 3 breeds' do
        Group.find_by(:name => 'Group III').sections.find_by(:name => 'Section 4').subsections.count.should eq 0
        Group.find_by(:name => 'Group III').sections.find_by(:name => 'Section 4').breeds.count.should eq 3
      end
    end

    # GROUP IV #
    ############
    describe 'Group IV' do
      # Section 1
      it 'Section 1 should have 0 subsections and 1 breed' do
        Group.find_by(:name => 'Group IV').sections.find_by(:name => 'Section 1').subsections.count.should eq 0
        Group.find_by(:name => 'Group IV').sections.find_by(:name => 'Section 1').breeds.count.should eq 1
      end
    end

    # GROUP V #
    ###########
    describe 'Group V' do
      # Section 1
      it 'Section 1 should have 0 subsections and 4 breeds' do
        Group.find_by(:name => 'Group V').sections.find_by(:name => 'Section 1').subsections.count.should eq 0
        Group.find_by(:name => 'Group V').sections.find_by(:name => 'Section 1').breeds.count.should eq 4
      end

      # Section 2
      it 'Section 2 should have 0 subsections and 10 breeds' do
        Group.find_by(:name => 'Group V').sections.find_by(:name => 'Section 2').subsections.count.should eq 0
        Group.find_by(:name => 'Group V').sections.find_by(:name => 'Section 2').breeds.count.should eq 10
      end

      # Section 3
      it 'Section 3 should have 0 subsections and 6 breeds' do
        Group.find_by(:name => 'Group V').sections.find_by(:name => 'Section 3').subsections.count.should eq 0
        Group.find_by(:name => 'Group V').sections.find_by(:name => 'Section 3').breeds.count.should eq 6
      end

      # Section 4
      it 'Section 4 should have 0 subsections and 2 breeds' do
        Group.find_by(:name => 'Group V').sections.find_by(:name => 'Section 4').subsections.count.should eq 0
        Group.find_by(:name => 'Group V').sections.find_by(:name => 'Section 4').breeds.count.should eq 2
      end

      # Section 5
      it 'Section 5 should have 0 subsections and 11 breeds' do
        Group.find_by(:name => 'Group V').sections.find_by(:name => 'Section 5').subsections.count.should eq 0
        Group.find_by(:name => 'Group V').sections.find_by(:name => 'Section 5').breeds.count.should eq 11
      end

      # Section 6
      it 'Section 6 should have 0 subsections and 5 breeds' do
        Group.find_by(:name => 'Group V').sections.find_by(:name => 'Section 6').subsections.count.should eq 0
        Group.find_by(:name => 'Group V').sections.find_by(:name => 'Section 6').breeds.count.should eq 5
      end

      # Section 7
      it 'Section 7 should have 0 subsections and 4 breeds' do
        Group.find_by(:name => 'Group V').sections.find_by(:name => 'Section 7').subsections.count.should eq 0
        Group.find_by(:name => 'Group V').sections.find_by(:name => 'Section 7').breeds.count.should eq 4
      end

      # Section 8
      it 'Section 8 should have 0 subsections and 1 breeds' do
        Group.find_by(:name => 'Group V').sections.find_by(:name => 'Section 8').subsections.count.should eq 0
        Group.find_by(:name => 'Group V').sections.find_by(:name => 'Section 8').breeds.count.should eq 1
      end
    end

    # GROUP VI #
    ############
    describe 'Group VI' do
      # Section 1
      it 'Section 1 should have 3 subsections' do
        Group.find_by(:name => 'Group VI').sections.find_by(:name => 'Section 1').subsections.count.should eq 3
      end

      it 'Subsection 1 from Section 1 should have 15 breeds' do
        Group.find_by(:name => 'Group VI').sections.find_by(:name => 'Section 1').
            subsections.find_by(:name => '1.1').breeds.count.should eq 15
      end

      it 'Subsection 2 from Section 1 should have 37 breeds' do
        Group.find_by(:name => 'Group VI').sections.find_by(:name => 'Section 1').
            subsections.find_by(:name => '1.2').breeds.count.should eq 37
      end

      it 'Subsection 3 from Section 1 should have 11 breeds' do
        Group.find_by(:name => 'Group VI').sections.find_by(:name => 'Section 1').
            subsections.find_by(:name => '1.3').breeds.count.should eq 11
      end

      # Section 2
      it 'Section 2 should have 0 subsections and 3 breeds' do
        Group.find_by(:name => 'Group VI').sections.find_by(:name => 'Section 2').subsections.count.should eq 0
        Group.find_by(:name => 'Group VI').sections.find_by(:name => 'Section 2').breeds.count.should eq 3
      end

      # Section 3
      it 'Section 3 should have 0 subsections and 2 breeds' do
        Group.find_by(:name => 'Group VI').sections.find_by(:name => 'Section 3').subsections.count.should eq 0
        Group.find_by(:name => 'Group VI').sections.find_by(:name => 'Section 3').breeds.count.should eq 2
      end
    end

    # GROUP VII #
    #############
    describe 'Group VII' do
      # Section 1
      it 'Section 1 should have 3 subsections' do
        Group.find_by(:name => 'Group VII').sections.find_by(:name => 'Section 1').subsections.count.should eq 3
      end

      it 'Subsection 1 from Section 1 should have 18 breeds' do
        Group.find_by(:name => 'Group VII').sections.find_by(:name => 'Section 1').
            subsections.find_by(:name => '1.1').breeds.count.should eq 18
      end

      it 'Subsection 2 from Section 1 should have 10 breeds' do
        Group.find_by(:name => 'Group VII').sections.find_by(:name => 'Section 1').
            subsections.find_by(:name => '1.2').breeds.count.should eq 10
      end

      it 'Subsection 3 from Section 1 should have 3 breeds' do
        Group.find_by(:name => 'Group VII').sections.find_by(:name => 'Section 1').
            subsections.find_by(:name => '1.3').breeds.count.should eq 3
      end

      # Section 2
      it 'Section 2 should have 2 subsections' do
        Group.find_by(:name => 'Group VII').sections.find_by(:name => 'Section 2').subsections.count.should eq 2
      end

      it 'Subsection 1 from Section 2 should have 1 breeds' do
        Group.find_by(:name => 'Group VII').sections.find_by(:name => 'Section 2').
            subsections.find_by(:name => '2.1').breeds.count.should eq 1
      end

      it 'Subsection 2 from Section 2 should have 4 breeds' do
        Group.find_by(:name => 'Group VII').sections.find_by(:name => 'Section 2').
            subsections.find_by(:name => '2.2').breeds.count.should eq 4
      end
    end

    # GROUP VIII #
    ##############
    describe 'Group VIII' do
      # Section 1
      it 'Section 1 should have 0 subsections and 6 breeds' do
        Group.find_by(:name => 'Group VIII').sections.find_by(:name => 'Section 1').subsections.count.should eq 0
        Group.find_by(:name => 'Group VIII').sections.find_by(:name => 'Section 1').breeds.count.should eq 6
      end

      # Section 2
      it 'Section 2 should have 0 subsections and 9 breeds' do
        Group.find_by(:name => 'Group VIII').sections.find_by(:name => 'Section 2').subsections.count.should eq 0
        Group.find_by(:name => 'Group VIII').sections.find_by(:name => 'Section 2').breeds.count.should eq 9
      end

      # Section 3
      it 'Section 3 should have 0 subsections and 7 breeds' do
        Group.find_by(:name => 'Group VIII').sections.find_by(:name => 'Section 3').subsections.count.should eq 0
        Group.find_by(:name => 'Group VIII').sections.find_by(:name => 'Section 3').breeds.count.should eq 7
      end
    end

    # GROUP IX #
    ############
    describe 'Group IX' do
      # Section 1
      it 'Section 1 should have 3 subsections' do
        Group.find_by(:name => 'Group IX').sections.find_by(:name => 'Section 1').subsections.count.should eq 3
      end

      it 'Subsection 1 from Section 1 should have 4 breeds' do
        Group.find_by(:name => 'Group IX').sections.find_by(:name => 'Section 1').
            subsections.find_by(:name => '1.1').breeds.count.should eq 4
      end

      it 'Subsection 2 from Section 1 should have 1 breeds' do
        Group.find_by(:name => 'Group IX').sections.find_by(:name => 'Section 1').
            subsections.find_by(:name => '1.2').breeds.count.should eq 1
      end

      it 'Subsection 3 from Section 1 should have 1 breeds' do
        Group.find_by(:name => 'Group IX').sections.find_by(:name => 'Section 1').
            subsections.find_by(:name => '1.3').breeds.count.should eq 1
      end

      # Section 2
      it 'Section 2 should have 0 subsections and 1 breeds' do
        Group.find_by(:name => 'Group IX').sections.find_by(:name => 'Section 2').subsections.count.should eq 0
        Group.find_by(:name => 'Group IX').sections.find_by(:name => 'Section 2').breeds.count.should eq 1
      end

      # Section 3
      it 'Section 3 should have 2 subsections' do
        Group.find_by(:name => 'Group IX').sections.find_by(:name => 'Section 3').subsections.count.should eq 2
      end

      it 'Subsection 1 from Section 1 should have 2 breeds' do
        Group.find_by(:name => 'Group IX').sections.find_by(:name => 'Section 3').
            subsections.find_by(:name => '3.1').breeds.count.should eq 2
      end

      it 'Subsection 2 from Section 1 should have 1 breeds' do
        Group.find_by(:name => 'Group IX').sections.find_by(:name => 'Section 3').
            subsections.find_by(:name => '3.2').breeds.count.should eq 1
      end

      # Section 4
      it 'Section 4 should have 0 subsections and 1 breeds' do
        Group.find_by(:name => 'Group IX').sections.find_by(:name => 'Section 4').subsections.count.should eq 0
        Group.find_by(:name => 'Group IX').sections.find_by(:name => 'Section 4').breeds.count.should eq 1
      end

      # Section 5
      it 'Section 5 should have 0 subsections and 4 breeds' do
        Group.find_by(:name => 'Group IX').sections.find_by(:name => 'Section 5').subsections.count.should eq 0
        Group.find_by(:name => 'Group IX').sections.find_by(:name => 'Section 5').breeds.count.should eq 4
      end

      # Section 6
      it 'Section 6 should have 0 subsections and 2 breeds' do
        Group.find_by(:name => 'Group IX').sections.find_by(:name => 'Section 6').subsections.count.should eq 0
        Group.find_by(:name => 'Group IX').sections.find_by(:name => 'Section 6').breeds.count.should eq 2
      end

      # Section 7
      it 'Section 7 should have 0 subsections and 2 breeds' do
        Group.find_by(:name => 'Group IX').sections.find_by(:name => 'Section 7').subsections.count.should eq 0
        Group.find_by(:name => 'Group IX').sections.find_by(:name => 'Section 7').breeds.count.should eq 2
      end

      # Section 8
      it 'Section 8 should have 0 subsections and 3 breeds' do
        Group.find_by(:name => 'Group IX').sections.find_by(:name => 'Section 8').subsections.count.should eq 0
        Group.find_by(:name => 'Group IX').sections.find_by(:name => 'Section 8').breeds.count.should eq 3
      end

      # Section 9
      it 'Section 9 should have 0 subsections and 1 breeds' do
        Group.find_by(:name => 'Group IX').sections.find_by(:name => 'Section 9').subsections.count.should eq 0
        Group.find_by(:name => 'Group IX').sections.find_by(:name => 'Section 9').breeds.count.should eq 1
      end

      # Section 10
      it 'Section 10 should have 0 subsections and 1 breeds' do
        Group.find_by(:name => 'Group IX').sections.find_by(:name => 'Section 10').subsections.count.should eq 0
        Group.find_by(:name => 'Group IX').sections.find_by(:name => 'Section 10').breeds.count.should eq 1
      end

      # Section 11
      it 'Section 11 should have 0 subsections and 1 breeds' do
        Group.find_by(:name => 'Group IX').sections.find_by(:name => 'Section 11').subsections.count.should eq 0
        Group.find_by(:name => 'Group IX').sections.find_by(:name => 'Section 11').breeds.count.should eq 1
      end
    end

    # GROUP X #
    ###########
    describe 'Group X' do
      # Section 1
      it 'Section 1 should have 0 subsections and 3 breeds' do
        Group.find_by(:name => 'Group X').sections.find_by(:name => 'Section 1').subsections.count.should eq 0
        Group.find_by(:name => 'Group X').sections.find_by(:name => 'Section 1').breeds.count.should eq 3
      end

      # Section 2
      it 'Section 2 should have 0 subsections and 2 breeds' do
        Group.find_by(:name => 'Group X').sections.find_by(:name => 'Section 2').subsections.count.should eq 0
        Group.find_by(:name => 'Group X').sections.find_by(:name => 'Section 2').breeds.count.should eq 2
      end

      # Section 3
      it 'Section 3 should have 0 subsections and 8 breeds' do
        Group.find_by(:name => 'Group X').sections.find_by(:name => 'Section 3').subsections.count.should eq 0
        Group.find_by(:name => 'Group X').sections.find_by(:name => 'Section 3').breeds.count.should eq 8
      end
    end
  end


  #############
  # VARIETIES #
  #############
  describe '#Varieties' do
    specify 'should have 125 varieties.' do
      Variety.count.should eq 125
    end

    # GROUP I #
    ###########
    describe 'Group I' do
      context 'should have (4+2+6+5+4+2+3) = 26 varieties.' do
        # Section 1
        it 'In section 1' do
          [
            ['Chien de Berger Belge', 4],
            ['Deutscher Schäferhund', 2],
            ['Mudi', 6],
            ['Puli', 5],
            ['Pumi', 4],
            ['Ca de Bestiar', 2],
            ['Hollandse Herdershond', 3]
          ].each do |name, count|
            Group.find_by!(:name => 'Group I').sections.find_by!(:name => 'Section 1').breeds.
                 find_by!('name LIKE ?', "%#{name}%").varieties.count.should eq count
          end
        end
      end
    end

    # GROUP II #
    ############
    describe 'Group II' do
      context 'should have (2+2+2) + (2+2+4) + (2+5) + (3+3+2+2) = 31 varieties.' do
        # Subsection 1.1
        it 'In subsection 1.1' do
          [
            ['Dobermann', 2],
            ['Deutscher Pinscher', 2],
            ['Zwergpinscher', 2]
          ].each do |name, count|
            Group.find_by!(:name => 'Group II').sections.find_by!(:name => 'Section 1').
                subsections.find_by!(:name => '1.1').breeds.find_by!('name LIKE ?', "%#{name}%").
                varieties.count.should eq count
          end
        end

        # Subsection 1.2
          it 'In subsection 1.2' do
          [
            ['Riesenschnauzer', 2],
            ['Schnauzer', 2],
            ['Zwergschnauzer', 4]
          ].each do |name, count|
            Group.find_by!(:name => 'Group II').sections.find_by!(:name => 'Section 1').
                subsections.find_by!(:name => '1.2').breeds.find_by!('name LIKE ?', "%#{name}%").
                varieties.count.should eq count
          end
        end

        # Subsection 2.1
        it 'In subsection 2.1' do
          [
            ['Deutscher Boxer', 2],
            ['Deutsche Dogge', 5]
          ].each do |name, count|
            Group.find_by!(:name => 'Group II').sections.find_by!(:name => 'Section 2').
                subsections.find_by!(:name => '2.1').breeds.find_by!('name LIKE ?', "%#{name}%").
                varieties.count.should eq count
          end
        end

        # Subsection 2.2
        it 'In subsection 2.2' do
          [
            ['Newfoundland', 3],
            ['Hovawart', 3],
            ['Cão da Serra da Estrela', 2],
            ['St.Bernhardshund (Bernhardiner)', 2]
          ].each do |name, count|
            Group.find_by!(:name => 'Group II').sections.find_by!(:name => 'Section 2').
                subsections.find_by!(:name => '2.2').breeds.find_by!('name LIKE ?', "%#{name}%").
                varieties.count.should eq count
          end
        end
      end
    end

    # GROUP III #
    #############
    describe 'Group III' do
      context 'should have 0 varieties.' do

      end
    end

    # GROUP IV #
    ############
    describe 'Group IV' do
      context 'should have 3 varieties.' do
        # Section 1
        it 'In section 1' do
          [
            ['Dachshund', 3]
          ].each do |name, count|
            Group.find_by!(:name => 'Group IV').sections.find_by!(:name => 'Section 1').breeds.
                find_by!('name LIKE ?', "%#{name}%").varieties.count.should eq count
          end
        end
      end
    end

    # GROUP V #
    ###########
    describe 'Group V' do
      context 'should have (6) + (3+3) + (2+2) = 16 varieties.' do
        # Section 4
        it 'In section 4' do
          [
            ['Deutscher Spitz', 6]
          ].each do |name, count|
            Group.find_by!(:name => 'Group V').sections.find_by!(:name => 'Section 4').breeds.
                find_by!('name LIKE ?', "%#{name}%").varieties.count.should eq count
          end
        end

        # Section 6
        it 'In section 4' do
          [
            ['Xoloitzcuintle', 3],
            ['Perro sin pelo del Perú', 3]
          ].each do |name, count|
            Group.find_by!(:name => 'Group V').sections.find_by!(:name => 'Section 6').breeds.
                find_by!('name LIKE ?', "%#{name}%").varieties.count.should eq count
          end
        end

        # Section 7
        it 'In section 7' do
          [
            ['Podengo Português', 2],
            ['Podenco Ibicenco', 2]
          ].each do |name, count|
            Group.find_by!(:name => 'Group V').sections.find_by!(:name => 'Section 7').breeds.
                find_by!('name LIKE ?', "%#{name}%").varieties.count.should eq count
          end
        end
      end
    end

    # GROUP VI #
    ############
    describe 'Group VI' do
      context 'should have (4) + (4) = 8 varieties.' do
        # Subsection 1.2
        it 'In subsection 1.2' do
          [
            ['Schweizer Laufhund-Chien Courant Suisse',4]
          ].each do |name, count|
            Group.find_by!(:name => 'Group VI').sections.find_by!(:name => 'Section 1').
                subsections.find_by!(:name => '1.2').breeds.find_by!('name LIKE ?', "%#{name}%").
                varieties.count.should eq count
          end
        end

        # Subsection 1.3
        it 'In subsection 1.3' do
          [
            ['Schweizerischer Niederlaufhund',4]
          ].each do |name, count|
            Group.find_by!(:name => 'Group VI').sections.find_by!(:name => 'Section 1').
                subsections.find_by!(:name => '1.3').breeds.find_by!('name LIKE ?', "%#{name}%").
                varieties.count.should eq count
          end
        end
      end
    end

    # GROUP VII #
    #############
    describe 'Group VII' do
      context 'should have (4) varieties.' do
        # Subsection 1.1
        it 'In subsection 1.1' do
          [
            ['Weimaraner',2],
            ['Bracco Italiano',2]
          ].each do |name, count|
            Group.find_by!(:name => 'Group VII').sections.find_by!(:name => 'Section 1').
                subsections.find_by!(:name => '1.1').breeds.find_by!('name LIKE ?', "%#{name}%").
                varieties.count.should eq count
          end
        end
      end
    end

    # GROUP VIII #
    ##############
    describe 'Group VIII' do
      context 'should have (4+3) + (2) = 9 varieties.' do
        # Section 2
        it 'In section 2' do
          [
            ['English Cocker Spaniel', 4],
            ['American Cocker Spaniel', 3]
          ].each do |name, count|
            Group.find_by!(:name => 'Group VIII').sections.find_by!(:name => 'Section 2').breeds.
                find_by!('name LIKE ?', "%#{name}%").varieties.count.should eq count
          end
        end

        # Section 3
        it 'In section 3' do
          [
            ['Cão de agua Português', 2]
          ].each do |name, count|
            Group.find_by!(:name => 'Group VIII').sections.find_by!(:name => 'Section 3').breeds.
                find_by!('name LIKE ?', "%#{name}%").varieties.count.should eq count
          end
        end
      end
    end

    # GROUP IX #
    ############
    describe 'Group IX' do
      context 'should have (4) + (2) + (4+4) + (4+2) + (2) + (2) = 24 varieties.' do
        # Section 2
        it 'In section 2' do
          [
            ['Caniche', 4]
          ].each do |name, count|
            Group.find_by!(:name => 'Group IX').sections.find_by!(:name => 'Section 2').breeds.
                find_by!('name LIKE ?', "%#{name}%").varieties.count.should eq count
          end
        end

        # Section 4
        it 'In section 4' do
          [
            ['Chinese Crested Dog', 2]
          ].each do |name, count|
            Group.find_by!(:name => 'Group IX').sections.find_by!(:name => 'Section 4').breeds.
                find_by!('name LIKE ?', "%#{name}%").varieties.count.should eq count
          end
        end

        # Section 6
        it 'In section 6' do
          [
            ['Cavalier King Charles Spaniel', 4],
            ['King Charles Spaniel', 4]
          ].each do |name, count|
            Group.find_by!(:name => 'Group IX').sections.find_by!(:name => 'Section 6').breeds.
                find_by!('name LIKE ?', "%#{name}%").varieties.count.should eq count
          end
        end

        # Section 8
        it 'In section 8' do
          [
            ['Pug', 4],
            ['Bouledogue français', 2]
          ].each do |name, count|
            Group.find_by!(:name => 'Group IX').sections.find_by!(:name => 'Section 8').breeds.
                find_by!('name LIKE ?', "%#{name}%").varieties.count.should eq count
          end
        end

        # Section 9
        it 'In section 9' do
          [
            ['Chihuahueño', 2]
          ].each do |name, count|
            Group.find_by!(:name => 'Group IX').sections.find_by!(:name => 'Section 9').breeds.
                find_by!('name LIKE ?', "%#{name}%").varieties.count.should eq count
          end
        end

        # Section 10
        it 'In section 10' do
          [
            ['Epagneul nain Continental', 2]
          ].each do |name, count|
            Group.find_by!(:name => 'Group IX').sections.find_by!(:name => 'Section 10').breeds.
                find_by!('name LIKE ?', "%#{name}%").varieties.count.should eq count
          end
        end
      end
    end

    # GROUP X #
    ###########
    describe 'Group X' do
      context 'should have (2) varieties.' do
        # Section 1
        it 'In section 1' do
          [
            ['Saluki', 2]
          ].each do |name, count|
            Group.find_by!(:name => 'Group X').sections.find_by!(:name => 'Section 1').breeds.
                find_by!('name LIKE ?', "%#{name}%").varieties.count.should eq count
          end
        end
      end
    end
  end

  ################
  # SUBVARIETIES #
  ################
  describe '#Subvarieties' do
    specify 'should have 48 subvarieties.' do
      Subvariety.count.should eq 48
    end

    # GROUP I #
    ###########
    describe 'Group I' do
      it 'should have 0 subvarieties.' do

      end
    end

    # GROUP II #
    ############
    describe 'Group II' do
      it 'should have 0 subvarieties.' do

      end
    end

    # GROUP III #
    #############
    describe 'Group III' do
      it 'should have 0 subvarieties.' do

      end
    end

    # GROUP IV #
    ############
    describe 'Group IV' do
      context 'should have 9 subvarieties.' do
        # Section 1
        it 'In section 1' do
          [
            ['Standard', 3],
            ['Miniature', 3],
            ['Rabbit Dachshund', 3]
          ].each do |name, count|
            Group.find_by!(:name => 'Group IV').sections.find_by!(:name => 'Section 1').breeds.
                find_by!('name LIKE ?', "%Dachshund%").varieties.find_by!(:name => "#{name}").
                subvarieties.count.should eq count
          end
        end
      end
    end

    # GROUP V #
    ###########
    describe 'Group V' do
      context 'should have (3+6+6) + (3+3) = 21 subvarieties.' do
        # Section 4
        it 'In section 4' do
          [
            ['Giant spitz', 3],
            ['Medium size Spitz', 6],
            ['Miniature Spitz', 6]
          ].each do |name, count|
            Group.find_by!(:name => 'Group V').sections.find_by!(:name => 'Section 4').breeds.
                find_by!('name LIKE ?', "%Deutscher Spitz%").varieties.find_by!(:name => "#{name}").
                subvarieties.count.should eq count
          end
        end

        # Section 7
        it 'In section 7' do
          [
            ['Long and wire-haired', 3],
            ['Smooth and short-haired', 3],
          ].each do |name, count|
            Group.find_by!(:name => 'Group V').sections.find_by!(:name => 'Section 7').breeds.
                find_by!('name LIKE ?', "%Podengo Português%").varieties.find_by!(:name => "#{name}").
                subvarieties.count.should eq count
          end
        end
      end
    end

    # GROUP VI #
    ############
    describe 'Group VI' do
      it 'should have 0 subvarieties.' do

      end
    end

    # GROUP VII #
    #############
    describe 'Group VII' do
      it 'should have 0 subvarieties.' do

      end
    end

    # GROUP VIII #
    ##############
    describe 'Group VIII' do
      it 'should have 0 subvarieties.' do

      end
    end

    # GROUP IX #
    ############
    describe 'Group IX' do
      context 'should have (18) subvarieties.' do
        # Section 2
        it 'In section 2' do
          [
            ['Standard', 6],
            ['Medium size', 6],
            ['Miniature', 6]
          ].each do |name, count|
            Group.find_by!(:name => 'Group IX').sections.find_by!(:name => 'Section 2').breeds.
                find_by!('name LIKE ?', "%Caniche%").varieties.find_by!(:name => "#{name}").
                subvarieties.count.should eq count
          end
        end
      end
    end

    # GROUP X #
    ###########
    describe 'Group X' do
      it 'should have 0 subvarieties' do

      end
    end
  end
end