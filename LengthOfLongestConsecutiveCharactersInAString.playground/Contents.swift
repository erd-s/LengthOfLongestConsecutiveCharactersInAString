///Find the length of the longest amount of consecutive characters in a string.

/*
INPUT --> OUTPUT
----------------
AAB --> 2
ABBB --> 3
AABBAA --> 2
CCDDAAA --> 3
*/

func lengthOfLongestConsecutiveCharactersIn(_ string: String) -> Int {
	guard !string.isEmpty else { return 0 }
	var charactersToTest = string
	guard let firstChar = charactersToTest.first else { return 0 }
	
	var forerunnerLongestCC: [Character] = [firstChar]
	var potentialLongestCC: [Character] = [firstChar]
	charactersToTest.removeFirst()
	
	for char in charactersToTest {
		if char == potentialLongestCC.last {
			potentialLongestCC.append(char)
		}
		
		//this needed to happen every time intead of being an else in the condition above
		if potentialLongestCC.count > forerunnerLongestCC.count {
			forerunnerLongestCC.removeAll()
			forerunnerLongestCC.append(contentsOf: potentialLongestCC)
		}
		
		//always remove from plcc when char is different than the char before
		if char != potentialLongestCC.last {
			potentialLongestCC.removeAll()
			potentialLongestCC.append(char)
		}
	}
	
	if forerunnerLongestCC.count > potentialLongestCC.count {
		return forerunnerLongestCC.count
	} else {
		return potentialLongestCC.count
	}
}

let AAB = lengthOfLongestConsecutiveCharactersIn("AAB") //2
let ABBB = lengthOfLongestConsecutiveCharactersIn("ABBB") //3
let AABBAA = lengthOfLongestConsecutiveCharactersIn("AABBAA") //2
let CCDDAAA = lengthOfLongestConsecutiveCharactersIn("CCDDAAA") //3
let AABCCABBBB = lengthOfLongestConsecutiveCharactersIn("AABCCABBBB") //4
let ABBBBBACCADDSAF = lengthOfLongestConsecutiveCharactersIn("ABBBBBBACCADDSAF") //6
let BDJJJJJEJJJNIMMMSLOLJJJJ = lengthOfLongestConsecutiveCharactersIn("BDJJJJJEJJJNIMMMSLOLJJJJ") //5

