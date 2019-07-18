defmodule Cards do
@moduledoc """
    Provides methods for creating and handling a deck of cards
"""

@doc """
Returns a list of strings representing a deck of playing cards
"""
def create_deck do
values =[ "One", "Two", "Three", "Four", "Five" ]
suits = ["Spades", "Clubs", "Hearts", "Diamonds"]
  for suit <- suits, value <- values do
  "#{value} of #{suit}"
  end
end

def shuffle(deck) do
  Enum.shuffle(deck)
end

@doc """
Detemines whether a deck contains a given card

## Examples

      iex>deck = Cards.create_deck
      iex>Cards.contains?(deck, "Ace of Spades")
      false
"""
def contains?(deck, card) do
Enum.member?(deck,card)
end

@doc """
Divides a deck into a hand and the rremainder of the deck
the `hand_size` argumeet indicates how many  cards should
be in the hand

## Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck,1)
      iex> hand
      ["One of Spades"]
"""
def deal(deck, hand_size) do
Enum.split(deck, hand_size)
end

def save(deck, filename) do
binary = :erlang.term_to_binary(deck)
File.write(filename, binary)
  end

  def load(filename) do
    {status, binary} = File.read(filename)
    case status do
      :ok  -> :erlang.term_to_binary binary
      :error -> "that File does not exist"
    end
  end


def create_hand(hand_size) do
Cards.create_deck
|> Cards.shuffle
|> Cards.deal(hand_size)
end




end
