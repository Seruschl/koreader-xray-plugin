return {
    -- Systemanweisung
    system_instruction = "Du bist ein*e erfahrene*r Literaturkritiker*in. Deine Antwort muss NUR im gültigen JSON-Format sein. Verwende kein Markdown, keine einleitenden Sätze und keine zusätzlichen Erklärungen.",
    
    -- Haupt-Prompt (Vollständige Buchanalyse)
    main = [[Buch: "%s" - Autor: %s
Erstelle detaillierte X-Ray-Daten für dieses Buch. Fülle das untenstehende JSON-Format VOLLSTÄNDIG aus.
REGELN:
1. Weiche nicht vom JSON-Format ab.
2. Das Feld "author_bio" ist VERPFLICHTEND; schreibe 2-3 Sätze über den/die Autor*in.
3. CHARAKTERE: Liste mindestens 15-20 Charaktere auf (Protagonist*innen und Nebenfiguren).
4. HISTORISCHE FIGUREN: Finde ECHTE historische Figuren, die im Buch erwähnt werden oder die Epoche beeinflussen. Falls keine vorhanden sind, lass es nicht leer; füge den König/Anführer der Epoche als "Period Figure" hinzu.
5. DETAILS: Lasse die Felder "importance_in_book" und "context_in_book" niemals leer. Analysiere den Kontext innerhalb des Buches.
ERFORDERLICHES JSON-FORMAT:
{
  "book_title": "Buchtitel",
  "author": "Name des Autors/der Autorin",
  "author_bio": "Detaillierte Informationen über das Leben und die literarische Persönlichkeit des Autors/der Autorin (Pflichtfeld)",
  "summary": "Umfassende Zusammenfassung des Buches (Spoiler-freier Überblick)",
  "characters": [
    {
      "name": "Name der Figur",
      "role": "Protagonist / Nebenfigur / Antagonist",
      "gender": "Männlich / Weiblich / Uneindeutig",
      "occupation": "Beruf oder Status",
      "description": "Detaillierte Analyse und Charaktereigenschaften der Figur"
    }
  ],
  "historical_figures": [
    {
      "name": "Name der historischen Figur",
      "role": "Rolle in der realen Geschichte (z. B. Kaiser, Philosoph)",
      "biography": "Kurze Biografie",
      "importance_in_book": "Welche Bedeutung hat diese Person im Buch? Warum wird sie erwähnt?",
      "context_in_book": "Wie erwähnen die Figuren diese Person? In welchem Kontext treten sie auf?"
    }
  ],
  "locations": [
    {"name": "Name des Ortes", "description": "Beschreibung des Ortes", "importance": "Bedeutung in der Geschichte"}
  ],
  "themes": ["Thema 1", "Thema 2", "Thema 3", "Thema 4", "Thema 5"],
  "timeline": [
    {"event": "Ereignistitel", "chapter": "Relevantes Kapitel/Abschnitt", "importance": "Bedeutung des Ereignisses"}
  ]
}]],

    -- Spoiler-freier Prompt (Basierend auf dem Lesefortschritt)
    spoiler_free = [[Buch: "%s" - Autor: %s
KRITISCH: Der/die Leser*in hat %d%% dieses Buches gelesen. Erstelle X-Ray-Daten NUR für Inhalte bis zu diesem Lesestand.

REGELN ZUR SPOILER-VERMEIDUNG:
1. NIMM KEINE Charaktere auf, die NACH diesem Lesepunkt erscheinen
2. ERWÄHNE KEINE Handlungselemente, die NACH diesem Punkt passieren
3. VERRATE KEINE Charakterentwicklungen, die später im Buch passieren
4. Timeline-Ereignisse dürfen NUR das abdecken, was der/die Leser*in bereits gelesen hat
5. Charakterbeschreibungen sollen ihren aktuellen Stand widerspiegeln, nicht spätere Entwicklungen
6. Die Zusammenfassung darf NUR Ereignisse abdecken, die der/die Leser*in bereits erlebt hat

ZUSÄTZLICHE REGELN:
1. Autor*innen-Bio ist verpflichtend (diese enthält niemals Spoiler)
2. Historische Figuren können enthalten sein, wenn sie im bereits gelesenen Teil erwähnt werden
3. Orte sollten nur diejenigen sein, die bisher besucht/erwähnt wurden
4. Themen sollten widerspiegeln, was bis zu diesem Punkt in der Geschichte erkennbar ist

ERFORDERLICHES JSON-FORMAT:
{
  "book_title": "Buchtitel",
  "author": "Name des Autors/der Autorin",
  "author_bio": "Detaillierte Informationen über das Leben und die literarische Persönlichkeit des Autors/der Autorin (Pflichtfeld)",
  "summary": "Zusammenfassung, die NUR das abdeckt, was bisher gelesen wurde",
  "characters": [
    {
      "name": "Name der Figur (nur wenn bereits eingeführt)",
      "role": "Protagonist / Nebenfigur / Antagonist",
      "gender": "Männlich / Weiblich / Uneindeutig",
      "occupation": "Beruf oder Status",
      "description": "Status der Figur zum aktuellen Lesepunkt – VERRATE keine späteren Entwicklungen"
    }
  ],
  "historical_figures": [
    {
      "name": "Name der historischen Figur",
      "role": "Rolle in der realen Geschichte",
      "biography": "Kurze Biografie",
      "importance_in_book": "Relevanz bis zum aktuellen Lesepunkt",
      "context_in_book": "Wie sie im bereits gelesenen Teil erwähnt wird"
    }
  ],
  "locations": [
    {"name": "Name des Ortes (nur wenn bisher besucht/erwähnt)", "description": "Beschreibung", "importance": "Bedeutung bis zu diesem Punkt"}
  ],
  "themes": ["Nur Themen, die bis jetzt in der Geschichte erkennbar sind"],
  "timeline": [
    {"event": "Ereignistitel (NUR Ereignisse, die bereits passiert sind)", "chapter": "Relevantes Kapitel/Abschnitt", "importance": "Bedeutung"}
  ]
}]],

    -- Fallback-Strings
    fallback = {
        unknown_book = "Unbekanntes Buch",
        unknown_author = "Unbekannter Autor",
        unnamed_character = "Unbenannte Figur",
        not_specified = "Nicht angegeben",
        no_description = "Keine Beschreibung",
        unnamed_person = "Unbenannte Person",
        no_biography = "Keine Biografie verfügbar"
    }
}
