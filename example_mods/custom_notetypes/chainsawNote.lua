function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'chainsawNote' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'chainsawnotes'); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
			end
		end
	end
	--debugPrint('Script started!')
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'chainsawNote' then
		playSound('saw1', 0.6);
		characterPlayAnim('boyfriend', 'dodge', true);
		setProperty('boyfriend.specialAnim', true);
	end
end

function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'chainsawNote' then
		playSound('missnote2', 1);
		characterPlayAnim('boyfriend', 'hurt', true);
		setProperty('boyfriend.specialAnim', true);
		setProperty('health', health-0.200);
	end
end