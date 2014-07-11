require 'spec_helper'

describe 'Seed Data' do
  before(:all) { load Rails.root + 'db/seeds.rb' }
  after(:all) { DatabaseCleaner.clean_with(:truncation) }

  describe 'Groups' do
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
  describe 'Sections' do
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
  describe 'Varieties' do
    specify 'should have 125 varieties' do
      Variety.count.should eq 125
    end

    # GROUP I #
    ###########


=begin    describe 'Group I' do
     it 'should have 4+4+2+4+6=26 varieties' do
        # Section 1

        [['Chien de Berger Belge', 2]].each do |name, count|
          puts 'aquí2', name, count
          Group.find_by!(:name => 'Group I').sections.find_by!(:name => 'Section 1').breeds.find_by!('name LIKE ?', "%#{name}%") do |breed|
            breed.varieties.count.should eq count
            puts 'aquí'
            puts breed.name
          end

        end
#        Group.find_by(:name => 'Group I').sections.find_by(:name => 'Section 1').breeds.
#            find_by('name LIKE ?', '%Chien de Berger Belge%').varieties.count.should eq 4
      end
    end
=end
    # GROUP II #
    ############
    describe 'Group II' do
      it 'should have 31 varieties' do
        # Subsection 1.1
        [
          Group.find_by(:name => 'Group II').sections.find_by(:name => 'Section 1').
              subsections.find_by(:name => '1.1').breeds
        ].each do |breed|

          breed.find_by('name LIKE ?', '%Dobermann%').varieties.count.should eq 2
          breed.find_by('name LIKE ?', '%Deutscher Pinscher%').varieties.count.should eq 2
          breed.find_by('name LIKE ?', '%Zwergpinscher%').varieties.count.should eq 2
        end

        # Subsection 1.2
        [
          Group.find_by(:name => 'Group II').sections.find_by(:name => 'Section 1').
              subsections.find_by(:name => '1.2').breeds
        ].each do |breed|
          breed.find_by('name LIKE ?', '%Riesenschnauzer%').varieties.count.should eq 2
          breed.find_by('name LIKE ?', '%Schnauzer%').varieties.count.should eq 2
          breed.find_by('name LIKE ?', '%Zwergschnauzer%').varieties.count.should eq 4
        end

        # Subsection 2.1
        [
          Group.find_by(:name => 'Group II').sections.find_by(:name => 'Section 2').
              subsections.find_by(:name => '2.1').breeds
        ].each do |breed|
          breed.find_by('name LIKE ?', '%Deutscher Boxer%').varieties.count.should eq 2
          breed.find_by('name LIKE ?', '%Deutsche Dogge%').varieties.count.should eq 5
        end

        # Subsection 2.2
        [
          Group.find_by(:name => 'Group II').sections.find_by(:name => 'Section 2').
              subsections.find_by(:name => '2.2').breeds
        ].each do |breed|
          breed.find_by('name LIKE ?', '%Newfoundland%').varieties.count.should eq 3
          breed.find_by('name LIKE ?', '%Hovawart%').varieties.count.should eq 3
          breed.find_by('name LIKE ?', '%Cão da Serra da Estrela%').varieties.count.should eq 2
          breed.find_by('name LIKE ?', '%St.Bernhardshund (Bernhardiner)%').varieties.count.should eq 2
        end
      end
    end

    # GROUP III #
    #############
    describe 'Group III' do
      it 'should have 0 varieties' do

      end
    end

    # GROUP IV #
    describe 'Group IV' do
      it 'should have 3 varieties' do
        [
          Group.find_by(:name => 'Group IV').sections.find_by(:name => 'Section 1').breeds
        ].each do |breed|
          breed.find_by('name LIKE ?', '%Dachshund%').varieties.count.should eq 3
        end
      end
    end

    # GROUP V #
    ###########
    describe 'Group V' do
      it 'should have 16 varieties' do
        # Section 4
        [
          Group.find_by(:name => 'Group V').sections.find_by(:name => 'Section 4').breeds
        ].each do |breed|
          breed.find_by('name LIKE ?', '%Deutscher Spitz%').varieties.count.should eq 6
        end

        # Section 6
        [
          Group.find_by(:name => 'Group V').sections.find_by(:name => 'Section 6').breeds
        ].each do |breed|
          breed.find_by('name LIKE ?', '%Xoloitzcuintle%').varieties.count.should eq 3
          breed.find_by('name LIKE ?', '%Perro sin pelo del Perú%').varieties.count.should eq 3
        end

        # Section 7
        [
          Group.find_by(:name => 'Group V').sections.find_by(:name => 'Section 7').breeds
        ].each do |breed|
          breed.find_by('name LIKE ?', '%Podengo Português%').varieties.count.should eq 2
          breed.find_by('name LIKE ?', '%Podenco Ibicenco%').varieties.count.should eq 2
        end

      end
    end

    # GROUP VI #
    ############
    describe 'Group VI' do
      it 'should have 8 varieties' do
        # Subsection 1.2
        [
          Group.find_by(:name => 'Group VI').sections.find_by(:name => 'Section 1').
              subsections.find_by(:name => '1.2').breeds
        ].each do |breed|
          breed.find_by('name LIKE ?', '%Schweizer Laufhund-Chien Courant Suisse%').varieties.count.should eq 4
        end

        # Subsection 1.3
        [
          Group.find_by(:name => 'Group VI').sections.find_by(:name => 'Section 1').
              subsections.find_by(:name => '1.3').breeds
        ].each do |breed|
          breed.find_by('name LIKE ?', '%Schweizerischer Niederlaufhund%').varieties.count.should eq 4
        end
      end
    end

    # GROUP VII #
    #############
    describe 'Group VII' do
      it 'should have 4 varieties' do
        # Subsection 1.1
        [
          Group.find_by(:name => 'Group VII').sections.find_by(:name => 'Section 1').
              subsections.find_by(:name => '1.1').breeds
        ].each do |breed|
          breed.find_by('name LIKE ?', '%Weimaraner%').varieties.count.should eq 2
          breed.find_by('name LIKE ?', '%Bracco Italiano%').varieties.count.should eq 2
        end
      end
    end

    # GROUP VIII #
    ##############
    describe 'Group VIII' do
      it 'should have 9 varieties' do
        # Section 2
        [
          Group.find_by(:name => 'Group VIII').sections.find_by(:name => 'Section 2').breeds
        ].each do |breed|
          breed.find_by('name LIKE ?', '%English Cocker Spaniel%').varieties.count.should eq 4
          breed.find_by('name LIKE ?', '%American Cocker Spaniel%').varieties.count.should eq 3
        end

        # Section 3
        [
          Group.find_by(:name => 'Group VIII').sections.find_by(:name => 'Section 3').breeds
        ].each do |breed|
          breed.find_by('name LIKE ?', '%Cão de agua Português%').varieties.count.should eq 2
        end
      end
    end

    # GROUP IX #
    ############
    describe 'Group IX' do
      it 'should have 24 varieties' do
        # Section 2
        [
          Group.find_by(:name => 'Group IX').sections.find_by(:name => 'Section 2').breeds
        ].each do |breed|
          breed.find_by('name LIKE ?', '%Caniche%').varieties.count.should eq 4
        end

        # Section 4
        [
          Group.find_by(:name => 'Group IX').sections.find_by(:name => 'Section 4').breeds
        ].each do |breed|
          breed.find_by('name LIKE ?', '%Chinese Crested Dog%').varieties.count.should eq 2
        end

        # Section 6
        [
          Group.find_by(:name => 'Group IX').sections.find_by(:name => 'Section 6').breeds
        ].each do |breed|
          breed.find_by('name LIKE ?', '%Cavalier King Charles Spaniel%').varieties.count.should eq 4
          breed.find_by('name LIKE ?', '%King Charles Spaniel%').varieties.count.should eq 4
        end

        # Section 8
        [
          Group.find_by(:name => 'Group IX').sections.find_by(:name => 'Section 8').breeds
        ].each do |breed|
          breed.find_by('name LIKE ?', '%Pug%').varieties.count.should eq 4
          breed.find_by('name LIKE ?', '%Bouledogue français%').varieties.count.should eq 2
        end

        # Section 9
        [
          Group.find_by(:name => 'Group IX').sections.find_by(:name => 'Section 9').breeds
        ].each do |breed|
          breed.find_by('name LIKE ?', '%Chihuahueño%').varieties.count.should eq 2
        end

        # Section 10
        [
          Group.find_by(:name => 'Group IX').sections.find_by(:name => 'Section 10').breeds
        ].each do |breed|
          breed.find_by('name LIKE ?', '%Epagneul nain Continental%').varieties.count.should eq 2
        end
      end
    end

    # GROUP X #
    ###########
    describe 'Group X' do
      it 'should have 2 varieties' do
        # Section 1
        [
          Group.find_by(:name => 'Group X').sections.find_by(:name => 'Section 1').breeds
        ].each do |breed|
          breed.find_by('name LIKE ?', '%Saluki%').varieties.count.should eq 2
        end
      end
    end
  end

  ################
  # SUBVARIETIES #
  ################
  describe 'Subvarieties' do
    specify 'should have 48 subvarieties' do
      Subvariety.count.should eq 48
    end

    # GROUP I #
    ###########
    describe 'Group I' do
      it 'should have 0 subvarieties' do

      end
    end

    # GROUP II #
    ############
    describe 'Group II' do
      it 'should have 0 subvarieties' do

      end
    end

    # GROUP III #
    #############
    describe 'Group III' do
      it 'should have 0 subvarieties' do

      end
    end

    # GROUP IV #
    ############
    describe 'Group IV' do
      it 'should have 9 subvarieties' do
        # Section 1
        [
          Group.find_by(:name => 'Group IV').sections.find_by(:name => 'Section 1').
              breeds.find_by('name LIKE ?', '%Dachshund%').varieties
        ].each do |variety|
          variety.find_by('name LIKE ?', '%Standard%').subvarieties.count.should eq 3
          variety.find_by('name LIKE ?', '%Miniature%').subvarieties.count.should eq 3
          variety.find_by('name LIKE ?', '%Rabbit Dachshund%').subvarieties.count.should eq 3
        end
      end
    end

    # GROUP V #
    ###########
    describe 'Group V' do
      it 'should have 21 subvarieties' do
        # Section 4
        [
          Group.find_by(:name => 'Group V').sections.find_by(:name => 'Section 4').
              breeds.find_by('name LIKE ?', '%Deutscher Spitz%').varieties
        ].each do |variety|
          variety.find_by('name LIKE ?', '%Giant spitz%').subvarieties.count.should eq 3
          variety.find_by('name LIKE ?', '%Medium size Spitz%').subvarieties.count.should eq 6
          variety.find_by('name LIKE ?', '%Miniature Spitz%').subvarieties.count.should eq 6
        end

        # Section 4
        [
          Group.find_by(:name => 'Group V').sections.find_by(:name => 'Section 7').
              breeds.find_by('name LIKE ?', '%Podengo Português%').varieties
        ].each do |variety|
          variety.find_by('name LIKE ?', '%Long and wire-haired%').subvarieties.count.should eq 3
          variety.find_by('name LIKE ?', '%Smooth and short-haired%').subvarieties.count.should eq 3
        end
      end
    end

    # GROUP VI #
    ############
    describe 'Group VI' do
      it 'should have 0 subvarieties' do

      end
    end

    # GROUP VII #
    #############
    describe 'Group VII' do
      it 'should have 0 subvarieties' do

      end
    end

    # GROUP VIII #
    ##############
    describe 'Group VIII' do
      it 'should have 0 subvarieties' do

      end
    end

    # GROUP IX #
    ############
    describe 'Group IX' do
      it 'should have 18 subvarieties' do
        # Section 2
        [
          Group.find_by(:name => 'Group IX').sections.find_by(:name => 'Section 2').
              breeds.find_by('name LIKE ?', '%Caniche%').varieties
        ].each do |variety|
          variety.find_by('name LIKE ?', '%Standard%').subvarieties.count.should eq 6
          variety.find_by('name LIKE ?', '%Medium size%').subvarieties.count.should eq 6
          variety.find_by('name LIKE ?', '%Miniature%').subvarieties.count.should eq 6
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