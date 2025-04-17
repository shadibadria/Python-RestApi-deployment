import pytest
from app import app as flask_app
from unittest.mock import patch, MagicMock

@pytest.fixture
def client():
    flask_app.config['TESTING'] = True
    with flask_app.test_client() as client:
        yield client

def test_health(client):
    response = client.get('/health')
    assert response.status_code == 200
    assert b"Up & Running" in response.data

@patch('app.get_db_connection')
def test_create_table(mock_db, client):
    mock_conn = MagicMock()
    mock_cursor = MagicMock()
    mock_db.return_value = mock_conn
    mock_conn.cursor.return_value = mock_cursor

    response = client.get('/create_table')
    assert response.status_code == 200
    assert b"Table created successfully" in response.data
    mock_cursor.execute.assert_called()

@patch('app.get_db_connection')
def test_insert_record(mock_db, client):
    mock_conn = MagicMock()
    mock_cursor = MagicMock()
    mock_db.return_value = mock_conn
    mock_conn.cursor.return_value = mock_cursor

    response = client.post('/insert_record', json={'name': 'Alice'})
    assert response.status_code == 200
    assert b"Record inserted successfully" in response.data
    mock_cursor.execute.assert_called_with("INSERT INTO example_table (name) VALUES (%s)", ('Alice',))

@patch('app.get_db_connection')
def test_data(mock_db, client):
    mock_conn = MagicMock()
    mock_cursor = MagicMock()
    mock_cursor.fetchall.return_value = [{'id': 1, 'name': 'Alice'}]
    mock_db.return_value = mock_conn
    mock_conn.cursor.return_value = mock_cursor

    response = client.get('/data')
    assert response.status_code == 200
    assert response.get_json() == [{'id': 1, 'name': 'Alice'}]

def test_index(client):
    response = client.get('/')
    assert response.status_code == 200
    # You may adjust the assertion depending on your template contents
