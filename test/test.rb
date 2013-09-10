require 'test/unit'
require './LP-parser.rb'

class ParserTest < Test::Unit::TestCase

    def testOpenFileReadIt
        entireData = FileParser.new
        assert_equal("[header]\nproject: Programming Test\nbudget : 4.5\naccessed :205\n\n[meta data]\ndescription : This is a tediously long description of the Lonely Planet\n programming test that you are taking. Tedious isn't the right word, but\n it's the first word that comes to mind.\n\ncorrection text: I meant 'moderately,' not 'tediously,' above.\n\n[ trailer ]\nbudget:all out of budget.", entireData.file)

        entireData.parser
        #name of first header
        assert_equal("header", entireData.section_key)

        entireData.headerCount
        #how many headers are there total?
        assert_equal(3, entireData.headerCount)

        entireData.allHeaders
        #list all headers
        #assert_equal(["header","meta data","trailer"],entireData.allHeaders)

        entireData.buildSection1Array
        #build up section 1 as an Array
        assert_equal(["header", "\nproject: Programming Test\nbudget : 4.5\naccessed :205\n\n"], entireData.buildSection1Array)

        entireData.buildAllSectionsIntoAnArray
        assert_equal(["header", "\nproject: Programming Test\nbudget : 4.5\naccessed :205\n\n"], ["meta data", "\ndescription : This is a tediously long description of the Lonely Planet\n programming test that you are taking. Tedious isn't the right word, but\n it's the first word that comes to mind.\n\ncorrection text: I meant 'moderately,' not 'tediously,' above.\n\n"], ["trailer", "\nbudget:all out of budget."], entireData.buildAllSectionsIntoAnArray)
    end
end

# end